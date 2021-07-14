Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CABC3C7A84
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jul 2021 02:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237127AbhGNAXX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 20:23:23 -0400
Received: from mail-mw2nam12on2138.outbound.protection.outlook.com ([40.107.244.138]:24416
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236981AbhGNAXW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Jul 2021 20:23:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3tUzA/5bBlkoNjbaHRdaRb2nvck5dkwONZa9BJOc2VZUlh26q5rzDuNTyeLYr4bKp3xKYeC0KcKM3tDfNBrWwy6LmQcl9fosTyDRFMFCj5weU3289UOSMhw/P0YSFeF4TvxOfc6mZU6bSfpxnPEE264xHSkqC1ITTVaVdhVQ8BYPOOJhLzSSWDBuUPWamWjcTgLeiuXseRJnq7bxe91FQGYQpWbrSWnXt8OBZctq9XOHWzHRxNBxCkhH8v94dYtXvP6THnZLSYFJIWOLje0vWezqbBOM9DqZoYtBjMFRRmcBRv8Ji3R+vejxklERuUQZpQ6rqstT3X3qvThk40ZMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJSt9lfBddrznmJCtOjnzUcSjv6MzR+Qn59y7L5Sg5I=;
 b=fYJIMR5r7KdkkfTyurURKMimx2DBhvHHlUukHmc6L2uNVcEQVY4VoHWD+Feo8soL7JwmU02xP3CrgJQ5qRe4HYBhStnceWfUFZNgy/uikZIDPnjjM0voYq4ZYOMUc7JbzX6IVUoF3WXv8xwg0CJIxuQ4mVSMQdNPFu1VaRkDUOAinScGlPa95idrXpGPviaGvK+RaSZrjFX2fehRfBt5fxpDIe55rGD7kUHRqfGQvkHRW0qfdqNfpDLIOKeBG1nkYATNLOmSOLOf+ICCFt8VzAOueqL9KeeC1ESwp/+Wk/anQbTJlZTZobFyZrp+oeJqp7wSq1Cml9TB6mIGNuPwJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJSt9lfBddrznmJCtOjnzUcSjv6MzR+Qn59y7L5Sg5I=;
 b=okRncF+eaD2TBL//CvmyU/b48R8HJafNc0gSyArkfuMJk97cVpLeq62rH9IWcrKedfSqmPCnojZnX3ydkROQS2SyvVK0Lp3YM4e8/ACsFOdJCjXF7RbE7TVUx2qfpFLRoYJFkRSNpDsmfNTrXVIsTwhzQqPFRdKhDaWZuQ051Jg=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none;os.amperecomputing.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6401.prod.exchangelabs.com (2603:10b6:303:67::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20; Wed, 14 Jul 2021 00:20:30 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 00:20:30 +0000
Subject: Re: [PATCH v4 0/3] Add SSIF BMC driver
To:     minyard@acm.org
Cc:     Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Wolfram Sang <wsa@kernel.org>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
References: <20210713055425.30636-1-quan@os.amperecomputing.com>
 <20210713154405.GB3406@minyard.net>
 <f7dd5b0f-a2a7-0a5f-3521-6721e8e52cb5@os.amperecomputing.com>
 <20210714001736.GD3406@minyard.net>
From:   Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <f59af5c6-517c-0c93-ff7a-5a5edac4d5bf@os.amperecomputing.com>
Date:   Wed, 14 Jul 2021 07:20:13 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
In-Reply-To: <20210714001736.GD3406@minyard.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR06CA0022.apcprd06.prod.outlook.com
 (2603:1096:202:2e::34) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:623c:5af9:f5a9:dac2:3878:4e29] (2402:800:623c:5af9:f5a9:dac2:3878:4e29) by HK2PR06CA0022.apcprd06.prod.outlook.com (2603:1096:202:2e::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 00:20:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 023e10d2-96e2-4d4b-5f24-08d9465d2fbc
X-MS-TrafficTypeDiagnostic: MW4PR01MB6401:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB6401DC0171E830A13CA5847FF2139@MW4PR01MB6401.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UUvjECE3izCL95XlMPO8tYgmwffkJjefRXAvvtqVkqSHvZrVb4RmGF0Oc+r0XJR4hTJQ8i88kTfUUFPKtKKRYgapIJjW9JMPptvFuSSz3hn1QilafDPwpkU1iPQ4j7TLCn/Y0S/GStmjiGgOOivEuVUTqeIxAF+XORMsT0qwO+5RKbkfXdOwEFOWrmwGbwO5k34B+amMRBj+q5BNgCSU46zoDKmyOUczE9aKYCTZXFX/XDCfdbHJL3PA7+GoddcP/+gYhYW65O7RAWu40w4QnYuV8+Vn4lQSjJzozb1OY1/hHg8t7iob5EEMuaUyavEEh5JG+q5fYZalQMtyX/Z4q7HU1+YTN9Sva/4WTKBq5pMHcjaeKJVNWr0gEwRkybYWhpEm8PNqLqPhtGdVgguGWv2qHZMtd7lVVbsnfZniXkgKYCk8vVoaEK+/AL5J4j9xUJ29tqrCIm+uu7/M9I0SLE5tL4ea09ixNG5ZJwvwjcLy2b0ETRWOhVi04bkQuBw0kwGbM0WtTItfRZcgWUbo7B6wOLTSZoq8Engym6kwnB/enErMXemQb9EubU3LyxXcFo0CE7xcjzHT3UxkFJ/cgLAVL4hNgSOJ02uZjDyTXu7YRuyUMq9pyKRKdqioO6p8BfCD0HoSWG2ioVkMQseUTJC+OWhNbF/nHyTTS/1+m0Qrt848RpUVOQ4ygNISrnUkaq7ZKNOYVIufOCkVD+vLSgrrcuqOUYX1hWIGy03FbzaANepImd5s41EInATfhlbQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR0102MB3482.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39840400004)(136003)(186003)(107886003)(7416002)(83380400001)(86362001)(4326008)(316002)(31696002)(66946007)(53546011)(66476007)(6486002)(52116002)(38100700002)(2906002)(5660300002)(54906003)(66556008)(31686004)(2616005)(6666004)(478600001)(8936002)(6916009)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnoxdzNkUTBpRm95NWt0TlFEL1BlN1BtR3NhYzN0RmtkZkNTT1VROGFmUjF3?=
 =?utf-8?B?UXNqRzNxQlA1QVJxRXNKTFp4YjYwUlhPaWcxb09VSGMrSkpJSkxuSmdLbk1Y?=
 =?utf-8?B?Tkx5bUhtNE55MTU2dzFTR0tTYm1OS3V6dnVuVXdaNXpKaXZvWUNJWTB6SGdy?=
 =?utf-8?B?bEdQYkRYZlp6MjU0aWlDZW1sV0txa01Fa2l4QXdQallScEkyUXlsYktYeDZh?=
 =?utf-8?B?VDA2aE10NUZWSEU5dmpIWFVuTmhFMTJUUWVGZnZTcTJqZWVRZ29TYTkwRHB1?=
 =?utf-8?B?WGVnMWt6WU5HNmNsbVBTcE9Fd0RWeVRoWGMvU2lDMzN0T1hDS0FUTnppM0c1?=
 =?utf-8?B?YmpvKzQrVTcvb2pMK3B0R3dVaytMTTFhamFzQUhvenhIY1pwSGJXWXdQSE15?=
 =?utf-8?B?ZTRPTGtZTkxPakJyYnZuekx2UHhpR2NjL2Fma3VFZmhUalFMVFU1L29kbTg1?=
 =?utf-8?B?RllrVm5lQXB5ODA2M1V0SG9HdUhIbDlFNUgrSEozemZyckp3OFhzM0Z4b3Nn?=
 =?utf-8?B?cERCZ0JXbERTMTdhbUoyL1RxSUEyM1RiUDVNNW5BaUQxcDFTVTlEZ2w2UjQ3?=
 =?utf-8?B?ZEhXdE5SbXFSQU9vZlkwcVAzb3hmN1A2Z1g1dXNPcDJWaWhHTGF4Q0JnalhI?=
 =?utf-8?B?czR6V0Vlb3FUaG5vRDBEeHQ1Ym40aDNzN3ZxUkhFb2lyRTN4MW5HL0tLVVJT?=
 =?utf-8?B?eXJqRTRUeUhHNEx0eE45Y3hYdkw4bXR2Nm54RCs4K0RRS3NpVUgrbFJGTy9Z?=
 =?utf-8?B?dVIrMGJpN2xLTUdPTjAxbDJZd1VsY3RwYXNEaDJySFVRVytYejVmQlh1MXlG?=
 =?utf-8?B?eWhORDhTZlFsVGhFMEtrY3ZXejlMM1d0Z3V1NWZQRDRJYVdVclY4UVV4RXo1?=
 =?utf-8?B?emU5b0dvWFlpQ0dWd1Vndnlva3BKUzBNYnRFMlVxcDZsQWJQUlR3TDR1Zjgr?=
 =?utf-8?B?Mzk4TnV5SmVGbkVXVlAwckt0U013cXJYclllLzg3YWpjajcxOWt4UlQxd2Ur?=
 =?utf-8?B?ZERxakNRWlkvMHAyWnR5TkxpNURCdFNDbmhUcjhRSDZJSHNzOENDYjJycVlX?=
 =?utf-8?B?NlJGZDV2UEUvUmdQMFdEY1NHZlFOZ0xoSnZYcGRReWtlVkViZGFuVDE1WmxS?=
 =?utf-8?B?a1hGNlcySUZSMEFmWHZxMjFpell0cXQ4a3FFdmxrQlBTRytWWWEyUnVvVHA3?=
 =?utf-8?B?Y1hWRkh1aWk2NHFpT3Rpd1V0OE0yZW5HUmM1Q0lGaUl3VmYvZUM2K0hsSi9z?=
 =?utf-8?B?Y3hnV3VFOGVwZVBid0VBM1hLdEVyTzFXcnVpSXZ5YVM5emwrYWE2S3Jsa2ta?=
 =?utf-8?B?dk9TcHY5V3JQS2cwcElpZVRCRkhkQk5yOERKbVRIL3puRXpid0o5NEQvVmpu?=
 =?utf-8?B?QThMS2kzNk94QjdTbDJFNWVhZ0VLQXh6NlhINUhQZDlYQW4wLzJ5Wkx5dlpN?=
 =?utf-8?B?REx0V2NKbkNNMHZBcHVXOGVuTHVLZU5veXF3S3Z3UXNpMm5XZXBoelVVbC9T?=
 =?utf-8?B?UnUvVU9UZFF4QjMxZWxYeVhTbWVBTGpvNTFsRGdZclcyVWtCOG5HSG5tUG5o?=
 =?utf-8?B?SFErdWdHWHhQTEh4TDk1cWdib2t4NjRDcWFQaUc4TGFNUXM1OXhIT2V0T0Vi?=
 =?utf-8?B?TWd0K2FzMXBJUG82UzNPMWRCQitZekJPRXRxbWd2SkhoRXVVTWg4MVRzVkZE?=
 =?utf-8?B?VXd5M1FFMnlWTjRZaUFoZktYMzEzRkU0ZkJoUFZCY0J6QW5QdU9QeXlxbjBx?=
 =?utf-8?B?TnhpdEFUQkYrdzVNQmtJUVc4WURqRHRDZmw0bWpVb2hzNUlhMFZ2QzdVNWRR?=
 =?utf-8?B?Sm5xT09Qd0E2L3ZKZUp1UmRTM2pMczNKald1TU1ZaXYyOHlCRU5aUkVqYzBV?=
 =?utf-8?Q?ofSEJQ+LLfswN?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023e10d2-96e2-4d4b-5f24-08d9465d2fbc
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 00:20:29.9051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuxqF6lt4pFb53R4W2Y84R0ns3hbMSwoFpl5UYC9GC3QEg8cNQOHzg3mBkTr/7URMpvjmkhWI1pM5jdfHGJ78KVvox0ebh+FmueZ0D7CoD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6401
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 14/07/2021 07:17, Corey Minyard wrote:
> On Wed, Jul 14, 2021 at 06:29:27AM +0700, Quan Nguyen wrote:
>> On 13/07/2021 22:44, Corey Minyard wrote:
>>> On Tue, Jul 13, 2021 at 12:54:22PM +0700, Quan Nguyen wrote:
>>>> This series add support the SSIF BMC driver which is to perform in-band
>>>> IPMI communication with their host in management (BMC) side.
>>>
>>> Per the kernel build robot, looks like patch 3 introduces slave_enable()
>>> but patch 1 uses it.
>>>
>>> -corey
>>>
>> Thanks Corey,
>>
>> The order is not correct and kernel build robot found this hurts
>> bisectibility.
>> The patch 3 should be the first patch.
> 
> Ok, can you re-submit in the right order?
> 
> Thanks,
> 
> -corey
> 
Yes, I will re-submit new series with right order soon.

>>
>> - Quan
>>
>>>>
>>>> SSIF BMC driver in this series is tested with Aspeed AST2500.
>>>>
>>>> v4:
>>>>     + Fix recursive spinlock                                      [Graeme]
>>>>     + Send response with Completion code 0xFF when aborting         [Quan]
>>>>     + Fix warning with dt_binding_check                              [Rob]
>>>>     + Change aspeed-ssif-bmc.yaml to ssif-bmc.yaml                  [Quan]
>>>>     + Added bounding check on SMBus writes and the whole request     [Dan]
>>>>     + Moved buffer to end of struct ssif_bmc_ctx to avoid context
>>>>       corruption if somehow buffer is written past the end           [Dan]
>>>>     + Return -EINVAL if userspace buffer too small, dont
>>>>       silence truncate                                       [Corey, Joel]
>>>>     + Not necessary to check NONBLOCK in lock                      [Corey]
>>>>     + Enforce one user at a time                                    [Joel]
>>>>     + Reject write with invalid response length from userspace     [Corey]
>>>>     + Add state machines for better ssif bmc state handling         [Quan]
>>>>     + Drop ssif_bmc_aspeed.c and make ssif_bmc.c is generic
>>>>       SSIF BMC driver                                               [Quan]
>>>>     + Change compatible string "aspeed,ast2500-ssif-bmc" to
>>>>       "ampere,ssif-bmc"                                             [Quan]
>>>>     + Toggle Slave enable in i2c-aspeed to turn on/off slave mode   [Ryan]
>>>>     + Added slave_enable() to struct i2c_algorithm to control
>>>>       slave mode and to address the recursive spinlock      [Graeme, Ryan]
>>>>     + Abort current request with invalid SMBus write or
>>>>       invalid command                                               [Quan]
>>>>     + Abort all request if there is pending response                [Quan]
>>>>     + Changed validate_pec() to validate_request()                  [Quan]
>>>>     + Add unsupported_smbus_cmd() to handle unknown SMBus command   [Quan]
>>>>     + Print internal state string for ease investigating issue      [Quan]
>>>>     + Move to READY state on SLAVE_STOP event                       [Quan]
>>>>     + Change initilize_transfer() to process_smbus_cmd()            [Quan]
>>>>     + Introduce functions for each slave event                      [Quan]
>>>>
>>>> v3:
>>>>     + Switched binding doc to use DT schema format [Rob]
>>>>     + Splited into generic ssif_bmc and aspeed-specific [Corey, Joel]
>>>>     + Removed redundant license info [Joel]
>>>>     + Switched to use traditional if-else [Joel]
>>>>     + Removed unused ssif_bmc_ioctl() [Joel]
>>>>     + Made handle_request()/complete_response() to return void [Joel]
>>>>     + Refactored send_ssif_bmc_response()/receive_ssif_bmc_request()
>>>>     [Corey]
>>>>     + Remove mutex [Corey]
>>>>     + Use spin_lock/unlock_irqsave/restore in callback [Corey]
>>>>     + Removed the unnecessary memset [Corey]
>>>>     + Switch to use dev_err() [Corey]
>>>>     + Combine mask/unmask two interrupts together [Corey]
>>>>     + Fixed unhandled Tx done with NAK [Quan]
>>>>     + Late ack'ed Tx done w/wo Ack irq [Quan]
>>>>     + Use aspeed-specific exported aspeed_set_slave_busy() when slave busy
>>>>     to fix the deadlock [Graeme, Philipp, Quan]
>>>>     + Clean buffer for last multipart read [Quan]
>>>>     + Handle unknown incoming command [Quan]
>>>>
>>>> v2:
>>>>     + Fixed compiling error with COMPILE_TEST for arc
>>>>
>>>> Quan Nguyen (3):
>>>>     ipmi: ssif_bmc: Add SSIF BMC driver
>>>>     bindings: ipmi: Add binding for SSIF BMC driver
>>>>     i2c: aspeed: Add slave_enable() to toggle slave mode
>>>>
>>>>    .../devicetree/bindings/ipmi/ssif-bmc.yaml    |  38 +
>>>>    drivers/char/ipmi/Kconfig                     |  11 +
>>>>    drivers/char/ipmi/Makefile                    |   1 +
>>>>    drivers/char/ipmi/ssif_bmc.c                  | 781 ++++++++++++++++++
>>>>    drivers/char/ipmi/ssif_bmc.h                  | 106 +++
>>>>    drivers/i2c/busses/i2c-aspeed.c               |  20 +
>>>>    include/linux/i2c.h                           |   2 +
>>>>    7 files changed, 959 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
>>>>    create mode 100644 drivers/char/ipmi/ssif_bmc.c
>>>>    create mode 100644 drivers/char/ipmi/ssif_bmc.h
>>>>
>>>> -- 
>>>> 2.28.0
>>>>
>>

