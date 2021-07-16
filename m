Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC5D93CB0DD
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jul 2021 04:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233413AbhGPCvD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Jul 2021 22:51:03 -0400
Received: from mail-dm6nam11on2099.outbound.protection.outlook.com ([40.107.223.99]:64050
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232046AbhGPCvC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Jul 2021 22:51:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFuc5y7wjR52Km5DwegyKnWAzdQpnSX8cR1wVGuGb4OJZRF7+ZYRwQz2KFj4GeVn/U6XPcjCWKYqOFF0blmDAK5hwJFhX6LYojpNZbtmqKJoFhY1f/ZvkijgmKLsiOcg16xoXzCvm7n4d+XgiFIofhQOuSQ2jRyp1F+lXEYEikKsQqlwdudSYAW5jw9+TrZM+ZrJidUtjcPDuNkQI8Q6yljBGovZJ+kxASFKUpR/h+FQsaMYkmXLPDUB58rPckjCs6QVZa2d2Vb2r5VGhyTvZM5JOPSiie7G/Zn+58B+iGzgiksevUtis6V7juZslouY4HN5pNriJUOlH35dYSb0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7zw78nN5+ZzVr2zvrgkL75ETOX1lHS4TBEMKxEt4Yc=;
 b=jxK0Ma0WnqocTxmyJFn5KouWIp4wS0olzNqRhkVZ2cmV3nJ1Q45ffyvboRp5djh44VZCXFG1aVZ3kl2ZGuu6jw9cLBfzgy8W1fhsorsL9t3xiL8ITMl/wp+jswoX1e9NTKUM63yugX+6E60z+4acSdJupJbEcVL/PQ9jswfo6BaoQJidCr8NL6kihlKR/SjIfQiQMprUBOW41VKVVrtzwwO5styjnq2N3++D+CTMbHStsZexuUw1V82AF/QxFzhOqls3Oion32Rr59B1TI4kFbsZ9lNAEoOGOczVxF58FQLCkVO32S9benpsjR7x5x//G/t7ZlUr+hdAzl59KL7FKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7zw78nN5+ZzVr2zvrgkL75ETOX1lHS4TBEMKxEt4Yc=;
 b=bmP8cHdT6vdsbE8Gf4HJxeMhFM6x/KR8S8+FC9hNsRH/Rd13STui6mTdmQkW7vQleOqBFmtyRy3OaakxRox7tms9lksG1639orAepI3RR8yI8cxpshC/TgjOrEdsiBxlD7TGGqPwxk7GKKTrthxJgsTxfPEH9UXA/4GfA5hCUmI=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none;os.amperecomputing.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR0101MB3039.prod.exchangelabs.com (2603:10b6:301:31::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22; Fri, 16 Jul 2021 02:48:05 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4331.026; Fri, 16 Jul 2021
 02:48:04 +0000
Subject: Re: [PATCH v5 0/3] Add SSIF BMC driver
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
References: <20210714033833.11640-1-quan@os.amperecomputing.com>
 <20210715233248.GF3406@minyard.net>
From:   Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <1f5ac258-084b-a71d-735e-c9f81d838c19@os.amperecomputing.com>
Date:   Fri, 16 Jul 2021 09:47:53 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
In-Reply-To: <20210715233248.GF3406@minyard.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR03CA0049.apcprd03.prod.outlook.com
 (2603:1096:202:17::19) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:623c:a5ad:439:3cf4:ddb0:478f] (2402:800:623c:a5ad:439:3cf4:ddb0:478f) by HK2PR03CA0049.apcprd03.prod.outlook.com (2603:1096:202:17::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.11 via Frontend Transport; Fri, 16 Jul 2021 02:48:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b687462a-e2c1-4507-8e63-08d94804227d
X-MS-TrafficTypeDiagnostic: MWHPR0101MB3039:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR0101MB303992EBF6FB470957663134F2119@MWHPR0101MB3039.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HcWFP3UAQG6vYg4G9ZWvGMSu9QzFGikcdkxUBGRXegMzM2bx/oE/8hnxTZVi1bPlyoO6/YTANnshlPoqJqbTvOsJVrHPtppWrd2IfCcbfjjVfsJt5FDJMDFQlZ721JSRKEE/SIMuWi7zS0hgJ327lz2MN8i05OsM2NE0TdO59Z+cHyY6CYxTtVuK1f+uXYwULqzpFgT82FYxxia1dNIytjCOL+E2zfQd19RuiAFCNpDAM6AkQ1MPZcb4XqQD0FWtehTSD0Dy2bAKHuOlidXUnz40UHvqod+6pUrFaPlKLgj7vCvWJlxb77uMlN4bKZBLQld0irke6pCixnUiTo3Y5HA17rBS9WS8lGSWPoXzMtXWbLwFEucGJUsZawhoCMoYzZAk2qSYnx676o5VVbHkJOC3e+nVNnSHaibruCb42nUczaIuXxqH6HyTXhpWmGdRMgXDc31ICSKbRm8aDnnv8AGe7GekPq5Xge4S7rb/X/wFIrF7N7wpszwje3pVuGOMh8Aj3L0xBVqtMYTXz1dRAOx795OFfhUI2rlpL7pKb+EqqqpYMYPAuh/abm8+nyJTaoCzJpZGO/U6QzXTiTDFTs71D9U5W7MhjGtlb2fNsIesnbHN42Rwi26ut1l8DufUUrl60ZPfJHIXZUafR35Aj2H7TfIDewD67XUEL70tew+eaUswPSpPlj+PdS+p3Z9y1uEwrlWwP0hU3M3EvejAwX2MInOQoTKMvuFOknO7Ojc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR0102MB3482.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(366004)(396003)(136003)(376002)(8936002)(8676002)(7416002)(107886003)(6486002)(2906002)(38100700002)(4326008)(83380400001)(31686004)(2616005)(54906003)(6916009)(66556008)(6666004)(66476007)(5660300002)(186003)(478600001)(66946007)(31696002)(52116002)(86362001)(316002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djhialB2MnpETDgvNVlna1ZKZVl0WDdVNFM5ekp4SFlKMkw4ZFF1RDRJNGVN?=
 =?utf-8?B?bGhMTmdhR1BGdHRiMzVuS0JOZHBrTnhndXBpUzFYZkFoSHlyV3RhN2ZaODV5?=
 =?utf-8?B?NUhrTTh5MVZLVVlPSlNjclQrbi92cnNleXU2ZG1CNHJHTzJRemh6NjAwVmQw?=
 =?utf-8?B?OVpuU2NJUytDa1Q3OTlCSjlsaU5wUUpBbHB2ODdpV0FVaFVkajl4ektZYWN5?=
 =?utf-8?B?RW1OTS95eWZsRVRSVkRUMEV4a0lTUnNIdWxLRWlGNng1Q3lzM1RPRHI2cEpE?=
 =?utf-8?B?R2tDV2RqL3Z0SzNqUWlXN0g1MDBMMkJ0bjVUZFN5NDNabW5kSkloL2NEZEVP?=
 =?utf-8?B?SmEyK0IvUVphVnMxVTVmYS9tSHdQRFB5TjhPRE9ZeE95S2dRTm1IYnhwdU05?=
 =?utf-8?B?NWs2SUkyKy9qclBiQjJtd1VGK0ZiMmlSalRyaUIyMHVUQlB6eWNBakRJZUtZ?=
 =?utf-8?B?cHVrMGlUdnNQOFVkd1pyMThObW5MQ3NWSkU3L1JSTjJKdStkNFh6RE5OWFk1?=
 =?utf-8?B?YlBFWTNxUDJhT0pKOS96dHBjWnhUNkgrc0lQV3hKWmsxM2dGZzNDdzc2a09l?=
 =?utf-8?B?RHFVZzZpOHFZNEg1bGFBZmZQYUpwZ1JzVXJUdnJnRXczT2RxWWJ1WSs3NkVT?=
 =?utf-8?B?M3ArQjlLaDNtTTArdmJpdlpkT1NLRHVUZUtaYWdCdmNUMndkbVp1dHRxZDc0?=
 =?utf-8?B?QmV1N2diMS9IZkl4NzJPSXBnNG9VMTR0U3E3ZVM2MWluSHdrdXpIUmZoZWR0?=
 =?utf-8?B?QjlacXByWS9qckhmb2E4cENRR1RrdCtyU1BvMzlQL2Q0MXphaVNqUjR2cEp4?=
 =?utf-8?B?RXZGNEs0ajdsVFZJK3hxdFFKNHRaLzhJZkcyNWcvTm95am1wR0RkRlV3N1lK?=
 =?utf-8?B?cWV2REZFT0hMWGJZWFM4aVNybjR5Y2hHTjkwR3NxWjE4eVppTkx6UjZ4cCs2?=
 =?utf-8?B?YW0wRGRXdlVvMy9FZUhuaXFuUHNCWnNGOUdyNlhxYlRRR0R4R3lEU2pSRzE2?=
 =?utf-8?B?a3l3UEczYzJETjk3bWQ0MWxqTjBVZ2pCSnVWQXRqUzVEQUk0WFowTGRBNlJX?=
 =?utf-8?B?ckY4T0JJRXFTV1pja0w2MktCUFUrcE9EeEdya0k3TVk0d0pHai9VQ3JvTmxU?=
 =?utf-8?B?UUc0QzRRQ0xRVElQSUl4dG1UL3VUN25aRFJBcllKR0lLdmlLR1BwWVVaM1NE?=
 =?utf-8?B?ZW93MjFQYlhGcUhlalB5ejlHcnR5RDVtOU1UWHR0TUR3VUhBK0hudldiV09x?=
 =?utf-8?B?dDU3Vmo3RUtSdUpRZm9yczhvTkp3MEd3ZEl4TW1Ja1dzRXE1SHJSVE54a0R1?=
 =?utf-8?B?R1B6NmdRaG52bUJQdkRnYWJya1NvT2V3VFdXeUlPeEREWEJCTUhuYTNENnpp?=
 =?utf-8?B?NGpYTEZjZ0x3dUsxLzZQa2FQUS9EeXpJdllOdTlDM244NHV2SUlhTStQUUFh?=
 =?utf-8?B?QlIyOTQ0cXgyTUpPOENhVG1aaVU3Ym9tQkNoWWRJRHZjd2VkVWlML3lHZ3dk?=
 =?utf-8?B?dy81Y0NOODI3eUZwRnQxb2RDRkZabGllclUweENWcml0UWEzU3FzNSttaG5i?=
 =?utf-8?B?a21zTnB2TWZhaHVCaGxHY0ExcGZtTkhYZ09wVml1OWk4dWlsZjJqMkV1Szdz?=
 =?utf-8?B?SXE3OU9LVGU1Z3NQMW5qS1hMRWw3V1ZpVVB1UGN2RGRqeTZOWkRwWTgrVzRW?=
 =?utf-8?B?Zk9vWWRkNXUvN1BKMEpMSHVBd1M4SHdCTXNhWFhiZGF2dk5IdklrSWtxaHh3?=
 =?utf-8?B?QitUSVRaR3NrSUxOZXc1eXZQR3RlcUg0UDNGeXRNK1RlQmdYaXA5MEl1SHor?=
 =?utf-8?B?TGpPQVVnVFgvb1YvQ21rYW8wcS9Zb1NkRE52ZlhqZU1MRlhBSStta1ZEVzV5?=
 =?utf-8?Q?K/fs+Urdn40Jl?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b687462a-e2c1-4507-8e63-08d94804227d
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 02:48:04.8696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: un4xjWYUee9q5PcaCi/+LcHg/lyR066okOyHcL57rP8S1J7zp3EFkLbZVsCMy7f43dWiYrYduSgDWS/TFUIovhDExnzkbMPGl+gzPucUc9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB3039
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16/07/2021 06:32, Corey Minyard wrote:
> On Wed, Jul 14, 2021 at 10:38:30AM +0700, Quan Nguyen wrote:
>> This series add support the SSIF BMC driver which is to perform in-band
>> IPMI communication with their host in management (BMC) side.
>>
>> SSIF BMC driver in this series is tested with Aspeed AST2500.
> 
> Ok, I have queued this and added Rob's review.  Five versions, you had
> to work for this one :).
> 
> Thanks,
> 
> -corey
> 
Thank you very much for your help in these version :)
- Quan

>>
>> v5:
>>    + Correct the patches order to fix the bisect issue found by
>>    kernel build robot
>>
>> v4:
>>    + Fix recursive spinlock                                      [Graeme]
>>    + Send response with Completion code 0xFF when aborting         [Quan]
>>    + Fix warning with dt_binding_check                              [Rob]
>>    + Change aspeed-ssif-bmc.yaml to ssif-bmc.yaml                  [Quan]
>>    + Added bounding check on SMBus writes and the whole request     [Dan]
>>    + Moved buffer to end of struct ssif_bmc_ctx to avoid context
>>      corruption if somehow buffer is written past the end           [Dan]
>>    + Return -EINVAL if userspace buffer too small, dont
>>      silence truncate                                       [Corey, Joel]
>>    + Not necessary to check NONBLOCK in lock                      [Corey]
>>    + Enforce one user at a time                                    [Joel]
>>    + Reject write with invalid response length from userspace     [Corey]
>>    + Add state machines for better ssif bmc state handling         [Quan]
>>    + Drop ssif_bmc_aspeed.c and make ssif_bmc.c is generic
>>      SSIF BMC driver                                               [Quan]
>>    + Change compatible string "aspeed,ast2500-ssif-bmc" to
>>      "ampere,ssif-bmc"                                             [Quan]
>>    + Toggle Slave enable in i2c-aspeed to turn on/off slave mode   [Ryan]
>>    + Added slave_enable() to struct i2c_algorithm to control
>>      slave mode and to address the recursive spinlock      [Graeme, Ryan]
>>    + Abort current request with invalid SMBus write or
>>      invalid command                                               [Quan]
>>    + Abort all request if there is pending response                [Quan]
>>    + Changed validate_pec() to validate_request()                  [Quan]
>>    + Add unsupported_smbus_cmd() to handle unknown SMBus command   [Quan]
>>    + Print internal state string for ease investigating issue      [Quan]
>>    + Move to READY state on SLAVE_STOP event                       [Quan]
>>    + Change initilize_transfer() to process_smbus_cmd()            [Quan]
>>    + Introduce functions for each slave event                      [Quan]
>>
>> v3:
>>    + Switched binding doc to use DT schema format [Rob]
>>    + Splited into generic ssif_bmc and aspeed-specific [Corey, Joel]
>>    + Removed redundant license info [Joel]
>>    + Switched to use traditional if-else [Joel]
>>    + Removed unused ssif_bmc_ioctl() [Joel]
>>    + Made handle_request()/complete_response() to return void [Joel]
>>    + Refactored send_ssif_bmc_response()/receive_ssif_bmc_request()
>>    [Corey]
>>    + Remove mutex [Corey]
>>    + Use spin_lock/unlock_irqsave/restore in callback [Corey]
>>    + Removed the unnecessary memset [Corey]
>>    + Switch to use dev_err() [Corey]
>>    + Combine mask/unmask two interrupts together [Corey]
>>    + Fixed unhandled Tx done with NAK [Quan]
>>    + Late ack'ed Tx done w/wo Ack irq [Quan]
>>    + Use aspeed-specific exported aspeed_set_slave_busy() when slave busy
>>    to fix the deadlock [Graeme, Philipp, Quan]
>>    + Clean buffer for last multipart read [Quan]
>>    + Handle unknown incoming command [Quan]
>>
>> v2:
>>    + Fixed compiling error with COMPILE_TEST for arc
>>
>> Quan Nguyen (3):
>>    i2c: aspeed: Add slave_enable() to toggle slave mode
>>    ipmi: ssif_bmc: Add SSIF BMC driver
>>    bindings: ipmi: Add binding for SSIF BMC driver
>>
>>   .../devicetree/bindings/ipmi/ssif-bmc.yaml    |  38 +
>>   drivers/char/ipmi/Kconfig                     |  11 +
>>   drivers/char/ipmi/Makefile                    |   1 +
>>   drivers/char/ipmi/ssif_bmc.c                  | 781 ++++++++++++++++++
>>   drivers/char/ipmi/ssif_bmc.h                  | 106 +++
>>   drivers/i2c/busses/i2c-aspeed.c               |  20 +
>>   include/linux/i2c.h                           |   2 +
>>   7 files changed, 959 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
>>   create mode 100644 drivers/char/ipmi/ssif_bmc.c
>>   create mode 100644 drivers/char/ipmi/ssif_bmc.h
>>
>> -- 
>> 2.28.0
>>

