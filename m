Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5881779E6CF
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 13:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240208AbjIMLcy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 07:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240228AbjIMLcx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 07:32:53 -0400
Received: from smtpout30.security-mail.net (smtpout30.security-mail.net [85.31.212.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52E9219AD
        for <linux-i2c@vger.kernel.org>; Wed, 13 Sep 2023 04:32:49 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by fx301.security-mail.net (Postfix) with ESMTP id 904645D9477
        for <linux-i2c@vger.kernel.org>; Wed, 13 Sep 2023 13:32:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
        s=sec-sig-email; t=1694604767;
        bh=Nq/+Jy5ugASIood7OhjT9QGuTZxZktIE6EUVygk8FpI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=Glt8z62DwSGyPKxfeBq/5kvxC50PouK8Ks+v4ulhwBgbaamLR9bjRwgkDNAcKsn2Y
         8NncJMO3AjfrTG7KdD+WJ05Dsxo3iiuK2r0M6+jZMtfb/gWdjBDDtnpuJ5kLzqaDrp
         ffWWCLX4C0KNmziQuHqmSKZHXu27wdu21VYqLscc=
Received: from fx301 (localhost [127.0.0.1]) by fx301.security-mail.net
 (Postfix) with ESMTP id 665C65D9262; Wed, 13 Sep 2023 13:32:47 +0200 (CEST)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0102.outbound.protection.outlook.com [104.47.25.102]) by
 fx301.security-mail.net (Postfix) with ESMTPS id DA46F5D946C; Wed, 13 Sep
 2023 13:32:46 +0200 (CEST)
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::5)
 by PR0P264MB3388.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:144::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 11:32:45 +0000
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2a88:7ccc:780c:c9f9]) by MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2a88:7ccc:780c:c9f9%5]) with mapi id 15.20.6792.019; Wed, 13 Sep
 2023 11:32:45 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <9b85.65019dde.d9678.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqJSeG2bOnEwIdXmVRbm2d0VrpLMAR3M7VFelVRafSSbV09GCOMthYwPcWWSSOdBGgP+5+SFaw58a+RFsYGFomxsS5PdjrxziJ3qp+uRQDz0MzIBrEYHKUEjQNfwBfpRnSH6UeOHtxgKesgPNIqJid//UtiWGqRSYx1p2+09fb8xWFP0NHiDn1fLrJZ+fcsux0I+ga0GELtzx1P18+o09nawuXvr9Uv6P+yBGdkEYsmG13MBvCFuM4M6SsEOmwtzZoMfpiRoIM5ZwClj5bWi33Bi2djy79JHIYrOuJtRA6Ol6cb5b3LrVxZmx4pWoFn2EiQ40NA5HpA479cRxob7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBwHhdjABNJBRgzhyE76Eggp7oldAax0peyN3oSQwlk=;
 b=ZhJcXcaUefdM+rqEFgWfqlw+NCepEs4QNCLbOkRjLSDnQnwPP1KWJC373A+NJGy1dcqhLFSV8zUVyTTTCAcgWzmGgccPz1KwXY/c733T2Bg5i0zQ5oN0WGzp/c3eczFi7UEjOmohbI/g7l534CBuqAQsH5qgwqoxsydBQF47bu6nMT2Av3qrgUnXUMu0FGjrbJa4FXNVTdevp/6vYfDRT0Cad/4JYBR5F22Cuk/KOpJtwhZKC/MHogvGRXg8LZMb9jRAlhE/4YcL/HNqNB2msInT+XJ2l5XPf1C1oXz+o/LLPU9rVklrMJhCnXmq7lWmGUBmGQwVoib2CV0cXCUqBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBwHhdjABNJBRgzhyE76Eggp7oldAax0peyN3oSQwlk=;
 b=aTTV2umdoCdPxAlUddO5oK87Dlf8vuvTDuid9PlwyEzu6o5eMHwqmdraOYy5n8digYe9cMFGQFsbdfdMJ9ANWEAkXnkwAt2mTQd+TIwmmUCVxNMcUIt9JFrLZMsWwqHa9TFonwfMpCMpdPnW+Pb2sVb7foVUv7JriJLLeAsTMYZWKqO8uqNyzj6AFvNZgl6HL8nxteKnNIvw+opr4Bt23fEYwZ/M7TJXzR9xnXFawxHrvaMsHZBv7kuaWJO+dfMPuZTVwzR7hMY3P0dJwXMI7J3EIdttOKK5eC8ZkSoHX6TJqxZiqgYBptuu/rCLO/IMkYTwURzQJKlBJkiT92VKXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Message-ID: <038e40c8-d6cd-150e-933e-5b2d2d7af7c5@kalrayinc.com>
Date:   Wed, 13 Sep 2023 13:32:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] i2c: designware: Fix corrupted memory seen in the ISR
Content-Language: en-us
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jan Bottorff <janb@os.amperecomputing.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230913010313.418159-1-janb@os.amperecomputing.com>
 <4537fa1c-b622-674c-026e-8453eda0a4d1@kalrayinc.com>
 <ZQGbaXTnIk0NIZbK@smile.fi.intel.com>
From:   Yann Sionneau <ysionneau@kalrayinc.com>
In-Reply-To: <ZQGbaXTnIk0NIZbK@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0300.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:370::12) To MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:13::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1890:EE_|PR0P264MB3388:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fafa474-35e8-4b24-24e0-08dbb44d2636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mOC9JvZsgzodgmg6lTEAuWYPbUNeglDlT0sTEs454C6hKTr5pnvj6b8Ku5QeZ0fLwC4yx/SjoY29KtNo1AspigodZwcspWKAtsz1ab9EdUz9db2pPaqklM7/ExSmwYt5M+sKErwOvdsoUYkpqqoBruVvCxSoXZtZ28JEAg8nwctMXdb+9XpAHYvPWMj3xcYumRDmPbyWyM8gtjmYKgYFKQWtOZPoW4AXEn2MlnShhfsSaAHzJcMr8RZqRIUTGsYqe/ihh38SWqH2d6+KAvKnLjahvxYUg96fTTOMKN/7CKy7dT7nhyc/JrJcCU6mwTbsYcQZ7h9atdtUloLMA49cBi8e4IxDnjjpU5mYrr2X8ZfKDbY4JC2TVt2Q6nzchgzfcBON00Ga/ege5/hA+UcyM26zYLlDzshODkWiz8lNJOQ4+vYgOiAjdntKLM82BTpTAWgKR9qjWuWWFIH2MENmyGUYCbkBjAlOB73dxAZyQeZmoWKvRQ2XD3k/UlWS9ZMbIKLKKnEQP9mRON1QPG3M8MdiP9D8zyjP8LsyofOOSD85UtSQ9LQDtsgj4tKqu3SgUfFYEpDdjSX7PF4FtRgmqLKUlJ3Yqy4dR//YXOWOh+YXYMGUxF4B1/R2AotvaNp3hyZ3uBxwufP6//fct+mtNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(396003)(346002)(366004)(1800799009)(186009)(451199024)(31686004)(6506007)(6486002)(53546011)(36756003)(86362001)(31696002)(38100700002)(2906002)(2616005)(6512007)(478600001)(83380400001)(5660300002)(4326008)(8676002)(8936002)(41300700001)(6916009)(66476007)(66946007)(54906003)(316002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UabJUu16zVTLvgfbjm/EVTYqK8RKreOFg3hPLlmlh/dRZ/paqavgrqfyXQPYcXYbALHzLIK/qHXXTQyXKEyJiAx765JgrIevF9GMr+VAFStBeHeKAlbZYR3igKHHemTPebAc3DkGE72dPKN7MZHwtG2OOmBSHv4qXxRBRVcWX1Ui2AQWWjbWErmiEQhWppwVW5E74uGQ0F+6KFToVebw2pLUXRY/XkHCqVIiYevuEoFWKN8XPkVHdGFxG9Fkw6gtvmYKtP1O5wRabEbRikOufDrTavBhgUtGNEwlcuWhB/Y9cl4xJ3o+Y+We4bafTiGe1D5X0mRKt/cm0ux4Cm3YHgpuGdinV+kQd+DAffq67RQ2TCW3GJ/tQArH9GzyZK87yLSaeZ3SXeuvDyLVCmqnwyEKYHwHWlu/vyjlHIWRL2HlC8Kjf6XTjfFCwNwRE1QMav44jaQaUEHt6sqGHIw4LsbQl4LQWGAcUKhHAQ5uMBosOFDykwrY9hdFvES7AYx5AmMoaAFI2fxFL3oqNVfuwZcfidKHrwaC+KGh8XMoLibtLNL0s9PTQL3R5OzZ9NMzdrqkIG1Vn5D0gQycBAZa6oq3izEvEvvly5GJGCFxLIxxQ+T6oI84pDxNYa9/NYI1tGuVEG7vIzuaJzaEO1yYinS2fpb0W43Ej4Olz/irLajYwBXyixPnU2FX0bsVPWjflk5gxwUkK9l1UmiTjap0JgFKMYDu4C/yHuzP8RMZBkd4yWxvDBgMJRgIW26OlLGX0DL5VKyBoM1DSI/15y+bgA3wxd7T5N0N7qQM8w1RbowYYsEhjqmtWH4TfcOpMWfJA3LNzerpmouGqOfOqb235kQWzUI0/SDbVN9cThYmheWzMhLv2BfTY4PNFZCdUGiXvAEXTYB+sM091rZgWAoidPIf8VbAUMJnEKUOshisZBNGkUAWktNJKcOQRGzDw55R
 hr6jiviaI5AVBxI4wUHYDIxRxfyN8KEDKDA+PwMJcmsKaQsWSiJ85lJGsBG77YWnQwELnumLLVbTQf576LOB+hykrQnAC0YR13BoGqLxQEHHHw5vn1gSKaGIg0y6OFNIh1ouSizwj+xYPri8a9k/wTXCoA6pCKyAxPpxS/fI4YeQCN11dYcZNwkiVVcc3QRJEG2da1JEW6OyYJEU+Y3hwTNGeCYKlSGvU0cDSJbLR47xSel7V9D9T4X8vGBv3rBqj40NMrTcPQpJrOLeVRotldjkkwBqqb2fxYlhEB4boAU0PTzeGiZ2eT3O5xiJZOKNcYIz7l1hsOZDtWCL6O7JS0kqyqYjj+O+FCCuCp6g76NHBPgKRhKftYaI/yI0kKhrT78psA5y00stQucmQxA4UhCPS4f/VZKVOV2MTJZ3Sx3uidIF8M+uYmXLRbi/ObfZvGrI7MdG2UFUN4X6/zlAyyMipHa8zd+1y33ssadnOT6JWGkRvm4Vm4TvEDOUn9eVvS9fuFKtG2q4cGI4QVj7bCVt6D1/DmxQ2g3s7VhXjB5Tya3ADR8wAob5wcieTK0a4Aw0KKbAaBqd/bLuMJ4+NsenQKkKM7T6krkN6eDbhXEguihbmeEWmkEBA1hd/CBj1Nb2wC1T9BrwZKtOeBIViXYt67Dv1YRUQrfYllB9QLTAMA5Q35kmydREeiL6bSGASg+uC8tLPTQjE0/ck3jmcQ==
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fafa474-35e8-4b24-24e0-08dbb44d2636
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 11:32:45.5130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ueiTytRGPiH3WvvgrH+LbbTchjsDn4f++jwUrnHL+snDvL0y+rw02mhYranEnYNS0P9ZKy+DEDhxBQgWBQqCng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3388
X-ALTERMIMEV2_out: done
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 13/09/2023 13:22, Andy Shevchenko wrote:
> On Wed, Sep 13, 2023 at 11:04:00AM +0200, Yann Sionneau wrote:
>> On 13/09/2023 03:03, Jan Bottorff wrote:
> ...
>
>>> +	/*
>>> +	 * To guarantee data written by the current core is visible to
>>> +	 * all cores, a write barrier is required. This needs to be
>>> +	 * before an interrupt causes execution on another core.
>>> +	 * For ARM processors, this needs to be a DSB barrier.
>>> +	 */
>>> +	wmb();
>> Apart from the commit message it looks good to me.
>>
>> If I understand correctly without this wmb() it is possible that the writes
>> to dev->msg_write_idx , dev->msg_read_idx = 0 etc would not yet be visible
>> to another CPU running the ISR handler right after enabling those.
> If this is the case, shouldn't we rather use READ_ONCE()/WRITE_ONCE() where
> appropriate?
>
To my knowledge the READ_ONCE()/WRITE_ONCE() only imply the use of 
volatile to access memory thus preventing the compiler to do weird 
optimizations like merging store/loads, moving store/loads, removing 
them etc

They don't imply a memory barrier.

Some systems need a memory barrier, to emit a "fence" like instruction, 
so that the pipeline stalls waiting for the store to "finish", for 
systems where the writes are posted.

Regards,

-- 

Yann





