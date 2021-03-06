/**
 * Copyright 2009-2012 WSO2, Inc. (http://wso2.com)
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.wso2.developerstudio.eclipse.gmf.esb;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.eclipse.emf.common.util.Enumerator;

/**
 * <!-- begin-user-doc -->
 * A representation of the literals of the enumeration '<em><b>Message Processor Type</b></em>',
 * and utility methods for working with them.
 * <!-- end-user-doc -->
 * @see org.wso2.developerstudio.eclipse.gmf.esb.EsbPackage#getMessageProcessorType()
 * @model
 * @generated
 */
public enum MessageProcessorType implements Enumerator {
	/**
	 * The '<em><b>SCHEDULED MSG FORWARDING</b></em>' literal object.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #SCHEDULED_MSG_FORWARDING_VALUE
	 * @generated
	 * @ordered
	 */
	SCHEDULED_MSG_FORWARDING(0, "SCHEDULED_MSG_FORWARDING", "SCHEDULED_MSG_FORWARDING"),

	/**
	 * The '<em><b>SCHEDULED FAILOVER MSG FORWARDING</b></em>' literal object.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #SCHEDULED_FAILOVER_MSG_FORWARDING_VALUE
	 * @generated
	 * @ordered
	 */
	SCHEDULED_FAILOVER_MSG_FORWARDING(1, "SCHEDULED_FAILOVER_MSG_FORWARDING", "SCHEDULED_FAILOVER_MSG_FORWARDING"), /**
	 * The '<em><b>MSG SAMPLING</b></em>' literal object.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #MSG_SAMPLING_VALUE
	 * @generated
	 * @ordered
	 */
	MSG_SAMPLING(2, "MSG_SAMPLING", "MSG_SAMPLING"),

	/**
	 * The '<em><b>CUSTOM</b></em>' literal object.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #CUSTOM_VALUE
	 * @generated
	 * @ordered
	 */
	CUSTOM(3, "CUSTOM", "CUSTOM");

	/**
	 * The '<em><b>SCHEDULED MSG FORWARDING</b></em>' literal value.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of '<em><b>SCHEDULED MSG FORWARDING</b></em>' literal object isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @see #SCHEDULED_MSG_FORWARDING
	 * @model
	 * @generated
	 * @ordered
	 */
	public static final int SCHEDULED_MSG_FORWARDING_VALUE = 0;

	/**
	 * The '<em><b>SCHEDULED FAILOVER MSG FORWARDING</b></em>' literal value.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of '<em><b>SCHEDULED FAILOVER MSG FORWARDING</b></em>' literal object isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @see #SCHEDULED_FAILOVER_MSG_FORWARDING
	 * @model
	 * @generated
	 * @ordered
	 */
	public static final int SCHEDULED_FAILOVER_MSG_FORWARDING_VALUE = 1;

	/**
	 * The '<em><b>MSG SAMPLING</b></em>' literal value.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of '<em><b>MSG SAMPLING</b></em>' literal object isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @see #MSG_SAMPLING
	 * @model
	 * @generated
	 * @ordered
	 */
	public static final int MSG_SAMPLING_VALUE = 2;

	/**
	 * The '<em><b>CUSTOM</b></em>' literal value.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of '<em><b>CUSTOM</b></em>' literal object isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @see #CUSTOM
	 * @model
	 * @generated
	 * @ordered
	 */
	public static final int CUSTOM_VALUE = 3;

	/**
	 * An array of all the '<em><b>Message Processor Type</b></em>' enumerators.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private static final MessageProcessorType[] VALUES_ARRAY =
		new MessageProcessorType[] {
			SCHEDULED_MSG_FORWARDING,
			SCHEDULED_FAILOVER_MSG_FORWARDING,
			MSG_SAMPLING,
			CUSTOM,
		};

	/**
	 * A public read-only list of all the '<em><b>Message Processor Type</b></em>' enumerators.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final List<MessageProcessorType> VALUES = Collections.unmodifiableList(Arrays.asList(VALUES_ARRAY));

	/**
	 * Returns the '<em><b>Message Processor Type</b></em>' literal with the specified literal value.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static MessageProcessorType get(String literal) {
		for (int i = 0; i < VALUES_ARRAY.length; ++i) {
			MessageProcessorType result = VALUES_ARRAY[i];
			if (result.toString().equals(literal)) {
				return result;
			}
		}
		return null;
	}

	/**
	 * Returns the '<em><b>Message Processor Type</b></em>' literal with the specified name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static MessageProcessorType getByName(String name) {
		for (int i = 0; i < VALUES_ARRAY.length; ++i) {
			MessageProcessorType result = VALUES_ARRAY[i];
			if (result.getName().equals(name)) {
				return result;
			}
		}
		return null;
	}

	/**
	 * Returns the '<em><b>Message Processor Type</b></em>' literal with the specified integer value.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static MessageProcessorType get(int value) {
		switch (value) {
			case SCHEDULED_MSG_FORWARDING_VALUE: return SCHEDULED_MSG_FORWARDING;
			case SCHEDULED_FAILOVER_MSG_FORWARDING_VALUE: return SCHEDULED_FAILOVER_MSG_FORWARDING;
			case MSG_SAMPLING_VALUE: return MSG_SAMPLING;
			case CUSTOM_VALUE: return CUSTOM;
		}
		return null;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private final int value;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private final String name;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private final String literal;

	/**
	 * Only this class can construct instances.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private MessageProcessorType(int value, String name, String literal) {
		this.value = value;
		this.name = name;
		this.literal = literal;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public int getValue() {
	  return value;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public String getName() {
	  return name;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public String getLiteral() {
	  return literal;
	}

	/**
	 * Returns the literal value of the enumerator, which is its string representation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public String toString() {
		return literal;
	}
	
} //MessageProcessorType
