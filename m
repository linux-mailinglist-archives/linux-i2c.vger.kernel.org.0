Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3E1783DE4
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Aug 2023 12:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233565AbjHVK21 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Aug 2023 06:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233913AbjHVK20 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Aug 2023 06:28:26 -0400
Received: from smtpout30.security-mail.net (smtpout30.security-mail.net [85.31.212.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECAE0CC8
        for <linux-i2c@vger.kernel.org>; Tue, 22 Aug 2023 03:28:05 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by fx301.security-mail.net (Postfix) with ESMTP id 509561AF93B
        for <linux-i2c@vger.kernel.org>; Tue, 22 Aug 2023 12:28:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
        s=sec-sig-email; t=1692700084;
        bh=1zIac0qjIIiYZ76lJZFRkTDchVNw7CX3AOKmsIh4AdA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=AJmS9vYJljF1KHBdUk0Mfvp66JdZfP+/jSPBV/NRj3S9i8d673epsWm9Vo6a+nv3U
         8yZMTbFhTlS1zaizolTb6mQpWhgZR+6hmTKtWqAlOtP48uAvAd9oAYy+PQJxnoM+qU
         cKVWFXtDiGXuU/cymhzjvtr7MYQNHiYnHc45jnc0=
Received: from fx301 (localhost [127.0.0.1]) by fx301.security-mail.net
 (Postfix) with ESMTP id 2C21C1AFE82; Tue, 22 Aug 2023 12:28:04 +0200 (CEST)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0101.outbound.protection.outlook.com [104.47.25.101]) by
 fx301.security-mail.net (Postfix) with ESMTPS id 922491AFAA0; Tue, 22 Aug
 2023 12:28:03 +0200 (CEST)
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::5)
 by PR1P264MB2094.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 10:28:02 +0000
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f704:3b18:55e0:64ca]) by MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f704:3b18:55e0:64ca%4]) with mapi id 15.20.6699.022; Tue, 22 Aug
 2023 10:28:02 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <14144.64e48db3.9175f.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=du96VKYqZuociShmxSSi9bcqVOMxLnGx6h2wyuDH2zPsVZVKZyQoPpOmo9XPRpBqskk25gW6ixUHv2TYO1umCglSliS/AFgPDmBRmRORB8vfOe2EwxSWZj7nx4m6tv2hiR6HEB7Frk7PdrZ82OwLBEhGgj56OyfqgVo/h3GLsgAPMQGT0dRuHncx9GBgf9jGwxq/UAilwV0GynZtytvvEpCzd2W7szufDuM/Fk8g37SiUTcodPuWTdI85wMQqWR71HxGAHkFH8SfEM1/FwGFYGuzmrFbyhOL/jxIqS8ZaJQFixFR9SrjXOiVCQkmmFIkUIUaVA8E5tN7m5kmPjvD0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcErVPEM83p47Qu0FJv5F3zWkeC86RPM635Yu8dT4ME=;
 b=K2Acd2vbCej3pVeB28HiQb5E2zfC/shSNJBCvkzoIq72vHsEaJSOTewBmGS393kavcuykD+fyH0kAk/hEJLYFD0GceXnwATeHTjqHABPs9ECZKo7+VHmNNsnhvcGcWz9oQ5vlCa0oy3GXuuJg6fdTbuhO55Y2UVXSPxklF5m7GrYaoxdOin0nW+V3pWRvoLhhK8fR/fO7zj6oxCblIBOrBuG3RcNcZrGphWweRMYdKgKfzfI8hSrv+o0g22T6S0ibTJSzKGJsVGxYo+2W7i8Qj4a6OIlebecBT37xoV5Gic9TbsUB4Vj4IIKbplU3lBW5JprmAQxddEOMDhTH04DsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcErVPEM83p47Qu0FJv5F3zWkeC86RPM635Yu8dT4ME=;
 b=MrHyJL8wpWk6j6xJG17ziun/VXL2e5uB4pFFnZBSO+eCv50ZWMG4uZRawR266FOprYi3a0sp9npPaKCKE7DPV05RsBIAjTFYRvakh37uSRfRQ+rRqngNfJ81ujUGMCIltSAZVwkn4lRtXLiYYUdj2g2edbQC+A6lGBcaw5D+Fm/kKKwsmXfRxhG8SO4M9wxEI34RvpJggthwthnTW2/Y5hcXRV8EreIe2JczYMAp56rYcTZVCVGiGHCxQFdMdtRZIVLUXTUV4VDMLyape1JeGp9MpQPjhN6hd9sgPeH09vX7Fpov5ldivAV+gfhgC8nXuDF12peL/fUhe+L2N4nfCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Message-ID: <89e54d6a-9105-bf6a-72bb-fd9e0fb7b2f8@kalrayinc.com>
Date:   Tue, 22 Aug 2023 12:28:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] i2c: designware: fix __i2c_dw_disable() in case
 master is holding SCL low
Content-Language: en-us
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Yann Sionneau <ysionneau@kalray.eu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Borne <jborne@kalray.eu>
References: <20230822090233.14885-1-ysionneau@kalray.eu>
 <2f215e0f-c2ed-4300-8b75-1949f17cdf1c@linux.intel.com>
From:   Yann Sionneau <ysionneau@kalrayinc.com>
In-Reply-To: <2f215e0f-c2ed-4300-8b75-1949f17cdf1c@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0197.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::13) To MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:13::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1890:EE_|PR1P264MB2094:EE_
X-MS-Office365-Filtering-Correlation-Id: 52d0752c-2984-479d-0f53-08dba2fa76ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qILwLohP0xsHx0IKMr7Wps5JY53l0vx1dbPiQtU9Kfeb9PHxfYzqRj/Xp8iRv+ktLm0PvPsQQhQTwzM175rlQgsKBQ9eAlu+dJHXivtzDJqRcXHtC/G2M3bE77xDrqT0hd16WQL6lxWrthsHh517/3dLv1cjHB03l+tl2nrZTahZ/G0+6egH5FimCsJ64kt02qb/QVHSobwO6Ko+T8nodQDsd3Jce55LGFLh6Q/oLQaxxiE6fcqJc1PsMObejuYt027OcjmbiZZoORMpsatZrxPtgZTrEF7/Q0XCbL4sjXJo3ZhnYJHME9cqsiQj/w9Uhn1T980HNPcj9WnY6eUXkFDw8STtqNi+RKjd6nD3vIICx70n+/maO5640IF+ZGKLvAOWIubCM0PHxIgEaYeATuM4BHjsGi1ZCgB+lV25BclMgPxiboP8lek4MIMseSYsydNlBapIwc97RRR5LgeUC/ieNgYlTP+gcdnROpgH2RuTTE33NW1YGSlt7ObT9tTAWmhT8QXOtQgqReR7Xu8ill7Nz4soW12knYyias35WK7x26DDYXr3Lyr78sW/pEtQYe24p8fFHz34x0OXNcEvJo3pHlKlGmtlb9Ebqzh6DX8ZYozul6RJpY2A3RSga0u4eldkvijAoF3sofWx6ke72DrLI7VYyMGb4FqkokEm+oY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(1800799009)(186009)(451199024)(6636002)(66476007)(66556008)(316002)(66946007)(6512007)(110136005)(8676002)(8936002)(2616005)(107886003)(4326008)(36756003)(41300700001)(966005)(478600001)(38100700002)(6506007)(6486002)(53546011)(83380400001)(2906002)(86362001)(31686004)(31696002)(5660300002)(26005)(70780200001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4mrvVGCADqYJ1t5oOSIVUOgl84L1B82wenbh7jtxdpnJxH7iyCBJAdEkhN4PrnBHBURS+NZQwKumdTaBN7VLNePIk+C5mZpKxJHD3FoU4tQkhIYvWxc1YITfalZa67ubltNStZ5kW7Vx1omkIWJfXN30m+WYFqZlSM9Kp1DDxcNhpKNConk7cPLCaIJSoAaH/rj+a/sQHCWO8A4HGu+TxHIwtl3iY14T3Vp93+a+6pW/rVPIvYKy+0Wt7Lf0J09tVK7ppFljz4IPHi8DC0b/8TaQaJq14idkhnF7sdFnoblT2rzQDA6JNwKQHexlX53oYkWIjRs6V+k+6f25wAC1RwavN+z0wpYnocnYp/QwszVKKsNVwW0wAAoGuowpkJii6H/8rbaTQA18J9VmchYlhMrNN0IBQuBT/TOmXu924zXxNc9/39pB3tSiBFgYW3pVHO06MEpMT1kP0Q3MpGMRrldQZPApfUdZuzoKlgoW0OyfzLTkNSvTZk6WMxASoDEuieegcShCnKVjWRG+eKB/LZ7UMPnatwOXTRr8yeOUo3iDxdzpz6qbyG1VSxHkund+PKfyzD2omQwlFwepS3ajM1UVXymRtCH+qWa8qsBEd67Avy2LAfwR2133sJmdy+eVAYMU74bMaH+zp5LnKOC+KFx5SsGlixSwXZJSEvlqWLDRrU+BOK2MiJyEtMB4fNca7ppW8E7bEZk3juZUerN23ifGtWeOTXXtSYltRTxFD64+keXzkPfMEQkHwCwFne8rm3+dOQLpY/s0jxxVnX255RxPGxSh613v+YAXrRNTTc0nLP8AJ2oVrptUYhRKxZTu0YbF8OBOLOPH4USz42bQQf8yJmDbR3z4AXJM80OmMzSl24P+nY3SX+3jBWM3GvqJAvu1XpF/cI8ENSE0QZUI4eQy/YSk3BWd3T8pgQ77EevmZwr+b0arJNuFG4289S17
 hkPnGgaikv4V800icOzObGiHS0X6OnuYx0rUHgf8HQ5+ohMnEcDHcrit57EBbMWHrOTyFq+JYfzAe5pFAoYdl8B7bAFW9zh11oftCzotTNzfisWzbrWTAWhFL1Aj0yKNL6NZUtKOMTjBRnq0uLNLylQMJZYihk2TupFwQvMBEg9eoNoc6AiKfQrE1T9vp5+iL6nBNATN6fMuMXDXJfruGdE0wQ4k2xai2posy4Ku1XQ7//nauOeu+k8AfUK28b/sOz1d814MAhyT1QGmN6E+kUWakyKonDkcoRMUx+CwkRyCuR4CwqPOpyir1JNZ7sEFhwvx0JeG01jl2ZN9Lr1X9eAS2WjeM40v0kUyJlQsipreCjpRTnPu0bB91iU/CHwzu0Geml9RbB7R1P0StYw1Ev0BSQzqUtx73hp0iPJHzVo5UynU/o1Da69DmgT/qPLFEVu2+79NO5GNjzZOtn3IyJVqhGyEZ38RlEywoW7V/dpGnra5e1FNM6f0zshseGMQ38o1vLtcFjvP9kczpXcMGIxegljnED6dlwanjwvRQEUKLV5My21EtmXsB0+bPPt8PfurrnAndAIRC5oQHhVqQCwxP+k7J0lg2MeojHXsKLu/WuEKD/I8qXdVu0Na9acm2HrqqwQgUI++Ow9Xg9BaqA==
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d0752c-2984-479d-0f53-08dba2fa76ca
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 10:28:02.2737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2CbBBJTaFvpK8VWX4aNWcyk09zJ45gIyrQtEW5hLiZX3q7VcOLp4UmV1gr2yaklqhGLeVZD/TRmpbdb3Z9/vNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2094
X-ALTERMIMEV2_out: done
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 8/22/23 12:14, Jarkko Nikula wrote:
> Hi
>
> On 8/22/23 12:02, Yann Sionneau wrote:
>> The DesignWare IP can be synthesized with the 
>> IC_EMPTYFIFO_HOLD_MASTER_EN
>> parameter.
>> In this case, when the TX FIFO gets empty and the last command didn't 
>> have
>> the STOP bit (IC_DATA_CMD[9]), the controller will hold SCL low until
>> a new command is pushed into the TX FIFO or the transfer is aborted.
>>
>> When the controller is holding SCL low, it cannot be disabled.
>> The transfer must first be aborted.
>> Also, the bus recovery won't work because SCL is held low by the master.
>>
>> Check if the master is holding SCL low in __i2c_dw_disable() before 
>> trying
>> to disable the controller. If SCL is held low, an abort is initiated.
>> When the abort is done, then proceed with disabling the controller.
>>
>> This whole situation can happen for instance during SMBus read data 
>> block
>> if the slave just responds with "byte count == 0".
>> This puts the driver in an unrecoverable state, because the 
>> controller is
>> holding SCL low and the current __i2c_dw_disable() procedure is not
>> working. In this situation only a SoC reset can fix the i2c bus.
>>
> Is this fixed already by the commit 69f035c480d7 ("i2c: designware: 
> Handle invalid SMBus block data response length value")?
>
> https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git/commit/?h=i2c/for-next&id=69f035c480d76f12bf061148ccfd578e1099e5fc 
>

Indeed the bug that I am having is fixed by 
69f035c480d76f12bf061148ccfd578e1099e5fc

Meaning that thanks to 69f035c receiving a SMBus byte count of 0 won't 
put the controller into a state where the completion will timeout and it 
will need to start a recovery that will fail and then a controller 
disabling that will also fail.

But, still, the disabling procedure is wrong, it lacks the abort part 
(in case SCL is held low).

What my patch does, is fixing the disabling procedure. So that - for 
example - even without 69f035c, the controller will timeout when 
receiving byte count of 0, triggering the "disabling" procedure which 
will work to recover the bus.

My patch fixes the general disabling code, that could be triggered by 
the bug fixed by 69f035c but also by any other bug really.

Speaking of 69f035c btw ... I am really wondering if it's the best fix, 
because it will lie to the kernel saying "we have byte count of 1, read 
another byte" to trigger a read with STOP bit set so that the transfer 
does finish and the controller does not timeout. But to do this it will 
do an extra spurious byte read.

I propose another approach that will acknowledge that "we are in a bad 
condition" and directly abort the transfer without doing an extra read: 
https://marc.info/?l=linux-i2c&m=169175828013532&w=2

I hope my answer to your question is clear enough... English is not my 
native language.

Regards,

-- 

Yann





