Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8546979E747
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 13:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234365AbjIMLye (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 07:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233243AbjIMLyd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 07:54:33 -0400
Received: from smtpout30.security-mail.net (smtpout30.security-mail.net [85.31.212.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9670C1999
        for <linux-i2c@vger.kernel.org>; Wed, 13 Sep 2023 04:54:29 -0700 (PDT)
Received: from localhost (fx306.security-mail.net [127.0.0.1])
        by fx306.security-mail.net (Postfix) with ESMTP id 1DA5035CFED
        for <linux-i2c@vger.kernel.org>; Wed, 13 Sep 2023 13:54:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
        s=sec-sig-email; t=1694606068;
        bh=3/g4P0htylg+FEt303NXXAkqadAxFE0IfaMqbRw8w7Y=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To;
        b=emss7bOSjGfdtgGtXanHid/4PTny3/43MkRGXqdN7OYUG2ZV7EY1AEig8dcJLBJ9h
         8kzGNVBTIYyum+BsLtII9dHRn1pVaog18wIE9Bsg8B+0errXjLeCyXPBgTSQhFurgm
         bRrQma62aE1dPSaRka6zsu+QoxL9vi76RYF8FT9A=
Received: from fx306 (fx306.security-mail.net [127.0.0.1]) by
 fx306.security-mail.net (Postfix) with ESMTP id D56E935CFBD; Wed, 13 Sep
 2023 13:54:27 +0200 (CEST)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01lp0101.outbound.protection.outlook.com [104.47.25.101]) by
 fx306.security-mail.net (Postfix) with ESMTPS id 7006635CFAA; Wed, 13 Sep
 2023 13:54:27 +0200 (CEST)
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::5)
 by MRZP264MB1669.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 11:54:26 +0000
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2a88:7ccc:780c:c9f9]) by MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2a88:7ccc:780c:c9f9%5]) with mapi id 15.20.6792.019; Wed, 13 Sep
 2023 11:54:26 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <5512.6501a2f3.6f044.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2j4veXq6mRqUlgol4p8jrzV3qF4VXdrraodIIxAflInZ1Nq4/rXD0uNj1ZRR4UHBb39F5vMFI8YcovVkJmEDRUPcZC1MUUPytUsgVUS+7vB9aRwMIoI8cvaISqWSraZnJBj6GV6AtFqZm3Seb6BQ2AXSyt9xSCrQTomLXi6TnYIMnCc++mseTDnKnl3pKLjTZG/4qy3MEF/TtmelqlNgLvRbPccZBNlAXCOsczgyim7SjgGGDqBpj615Hqq5EvbWzsCs5cA9p6XMJqYGHKWOT7esddDW1bb09GPuDtGzdm2AzP92OXIUMHGb1O/lMbP5Gibc+It8bVKRRetR5dHdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRjOpRGrYY8H7OWgI7AunRzgdeqoAn146xjNSgJqBow=;
 b=OEKdET9wQLoDoUNPVKV7wuRp+M4WBbp/0yXjaLO/MiRdS/SRI0yJcD0/KrbnpJlCwhv+fG0WG2ysFyTCRCNES7hs2RBPEXZ6XS58GKKEWEP4B5hA14YnoqHnIXlYykv7CBjOeGkyr+R3O0+b/tZKkq7ykVVlCNnBWg27bWN5elLzuP4gsxyfg8nZ3c+LF7yfSyTHJgIN0gV4QbGBjwYKdvlPYGieVWG/c/NK2ZDwr9Cl9xiR51dvZ3qwldCoE4ZstVpcIYFrOUAVYUNLkmjjhjnlzgtzwmBSt8hmX+xbYKhQ32FulHuYq4LYbIgyEXCiiuk79Tll5m42KjFndz6Elg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRjOpRGrYY8H7OWgI7AunRzgdeqoAn146xjNSgJqBow=;
 b=RRQw7Im6jBs1fDVJqf7xg1ZvEdyYoZNoCq2INOz+KBfx8iOUeRFZYu4uqDld3n6UYAsgEZsQV+Qhj1slQ/KSSSsSN8unSk0NttTA1/TJ4uvZGQ6t1PCR3Ika5er5RSWSv0sQxypv7j0mwpVYjokU2K/DgGWP0Hw0dA6P6vAnJoQNwnZz/NI7h2Q8KvuW5VBX44i67vp3IdGq6wPhIPnIVxv7ZcK5vtlW2IB3rEhcdxZttVHIu/QRzLgTiMWPAeI/pttR4A/9l83uxmcR48RJ7mGQi/NIhhbQ+aqoh6p/vWmRvRdUVMb6qfx/hyvtkDsmzY6ddMH+6N1jk7+tda93ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Message-ID: <2657e064-c537-c898-668f-b5e82228ec5a@kalrayinc.com>
Date:   Wed, 13 Sep 2023 13:54:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] i2c: designware: Fix corrupted memory seen in the ISR
Content-Language: en-us
From:   Yann Sionneau <ysionneau@kalrayinc.com>
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
 <038e40c8-d6cd-150e-933e-5b2d2d7af7c5@kalrayinc.com>
In-Reply-To: <038e40c8-d6cd-150e-933e-5b2d2d7af7c5@kalrayinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ce::8) To MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:13::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1890:EE_|MRZP264MB1669:EE_
X-MS-Office365-Filtering-Correlation-Id: b948251a-0dac-4ef3-7bed-08dbb4502dc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8tSmAHZcsj19/v9XAKMzLqu0pDrtHLM7HjlkmE5vD7aloZreg3sg96tGMM8hEYgnc4htRKC1aBWy7muh1bJ5nb+mh98CPDUYnFqQJiWdqeNPXQBP2/uvNmArx6YkeXXg9F4S7TEevigkWu7m/uSKgbHdavjndNpWMlB04Yp66w/Ig+fqlXdL5eKINOIwAZ3rVHyJsTuIwgCfNptOf9WIbaLbOfd5p8aVBrfRbgep4qGYBhOlw3Ty8IiHRzRjKSzHPBmfEelzDAQ3Ju1X428L+PppfEnBOsN1nmHKXBSbFHOkjDgyyrOE3MxkocaTHCYfuknYprkAvVpHAVHOV7ljCrzRJzX3RPGZktx+StFqQL/d1kfuUPr7mabzUqMkBnc/4bqZ8jZn5dxwEDUcffgzBAKTrE3+i9zm6po9s5rNWmDz/fU83MSvmZ7ISt4nesD9pi7dzXivRQgEEDpnDEfnkZy77y/RPc2LEsLP4cnov1cg/QeAlE7h8jqIvBUlX8gaOR+3zWX8cR/0nMvVc6czTy2V2t/gXLBooPY28ONFT0OyRWEK69D0qt99Yd8Omdh4l8Z7fInHCprn8jXMXXALemCom+9fAdGbv4u1W7DGIS0/yokkPbm9IMG8R86ZZEfaK2DT+UVgPRH0E6IzBb3etw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(39860400002)(136003)(346002)(1800799009)(186009)(451199024)(31696002)(8936002)(4326008)(5660300002)(2906002)(86362001)(8676002)(36756003)(38100700002)(83380400001)(478600001)(966005)(53546011)(6486002)(6506007)(2616005)(54906003)(6512007)(41300700001)(316002)(6916009)(31686004)(66476007)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: M7b0I1W/oue3En6XIhlVhNRgQgrk6IwLBUwZHGGnjohCA5HH6PvkBYMnXWVrD8te4j1HMSouAiI+lkVxv/RLH/a7U8+itma5iDm8mLgwsx1T/W7aC6cw4jr+BvOA4rRLwKpiUV03P03x5UVjoi8hcra094OTH7QCg+Uzp5uTV1JVk4dpPV4A5iesurQS0cv2/Iy+BODevN6vhKQhcLHs1a6ROieTEcWAhKAL6XP74wflH0LWRStosqN9ZL0G45lhh0Leg28Xl8nVFsbnAuhqL1J/xMbjDt6Nq9mVuSwvsVQ2Vux5S18O/LR3shNqnV5F+JV++H6hPohQIA+2MtgMzu54l8P/XE0vRjxegXzy/3xvPicNAItd73MduNAgcr0I4WFByQOTW8lZLUxk9iTNJQkpor2yZwhbJvjB6Vl4vLtSKd4wiTZEuachJ3l/0kN5P4xDFJncRhWyKNMxmfbGcdouMhJkou9dV/Wa5Inl4/e6AthVE9naDtRYE2l6nktlkOQKloSv6IO0ncuFdHThODaD6cD73LHr7OFhwvF5nY+CEVWqCmVQp4RL5wIhwEKvauqGJprC7CyHTt/qZWWvhhNx8fNy80oWMEkXp4WI8uRjqH8uJefKpqHTplqGXw42y15hio3yR2KWp37GevuiQnMpuynoEFQgBcWWoU/bhBKQxbLNLRO2iaSO94JvU/RGdMOf9lyAbgzBq7QJU+UvZYvz6hXskiVGm7HsG2hZHGhx4tHfLE0KunrRp0AsaGpl6yFRjfv2yIM8BbHF2ABLQ9I4XgdvQCQmyP7pRYPnPsB5VgF1cOfSCqAsdTZlvPPBkrqYUPk5idjz1Q5Fiq3Dolw9Gg1kN6rcfJxT8VQDfBEW3loTYSkdKg4zBAtfphGcgjG5minmApd5e+g7+h2tMQlR99IwPAl2xKktwBp+u53zQRZ0ODYRTrvn7cLncrtS
 HqeBBQRwgXLAcwThxNqZ/2XGsdXc09rFbbWzSqc9ZawSjvVagM7RwQMKKNGifTnNyG9NVlx826J+osON6MiqqHYyjBo+uDKVMhlVLMGEArxFPFswYdkTWsUTBZhEFDrgE/TjFyA3D8TVLqBFB+j4+1zyOipq3CAcKwzDHkt54H3sszx5OPkltiFOhkxOF4mect4WUJFay0ENoRoH2Qst/sAsn/ChNrH9VRMzEKefQ/h0DJhVY/q3WGrhqmGi3g3GGuTLZn3IvGlVhmDgxKnFVSf/dqVZ2Hja/K0WYgWe7ZN6dpF9uS2cfnjSF1HCkgiQZgkm0mHu/6EYHNzATVJDi5/Fvw4DtOptPdMLA/g09hXx1+2pTcYYtGjttz6mm7jOL9O+VcCy2YpiCRVIYNnVKkvt3bmgFXIyrlxBrOT2dwLSRTqTuFwltegmVolgwfjzRE1H+AcxlXDqfFnzJalos48CewBUOnV/pHan9LLBsJEt3DB711uHQNlXOCRvFhhkvJtLd+3t98mgTsEN3mY+6BtFXTQwLplFEjQpHdXUWHV+l0WvEbTYuOAcVtGp9cvMeG8O+V++WWb3IgOfAwumNiJ35J2FKPnAnVYX0dNaiFKZ1bri3eIU3ZLlCkE0Vf/vtoIOILwcDi9Gwdm7MMNGoLfbcGijizjOIgVDGI+iF1cVqacBZVkkdRBVCiiNcMBjVjOrOqIc8ETGjvfDs56Y5A==
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b948251a-0dac-4ef3-7bed-08dbb4502dc4
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 11:54:26.2821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q399y4DJQ8dgIBl8ogtwtv7fu5YnvsXRfv7CSiVD4gdrlfgBV2juMzJxosmJfHzmaNlpcY4zpBTUIGCD+3bkfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1669
X-ALTERMIMEV2_out: done
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 13/09/2023 13:32, Yann Sionneau wrote:
>
> On 13/09/2023 13:22, Andy Shevchenko wrote:
>> On Wed, Sep 13, 2023 at 11:04:00AM +0200, Yann Sionneau wrote:
>>> On 13/09/2023 03:03, Jan Bottorff wrote:
>> ...
>>
>>>> +    /*
>>>> +     * To guarantee data written by the current core is visible to
>>>> +     * all cores, a write barrier is required. This needs to be
>>>> +     * before an interrupt causes execution on another core.
>>>> +     * For ARM processors, this needs to be a DSB barrier.
>>>> +     */
>>>> +    wmb();
>>> Apart from the commit message it looks good to me.
>>>
>>> If I understand correctly without this wmb() it is possible that the 
>>> writes
>>> to dev->msg_write_idx , dev->msg_read_idx = 0 etc would not yet be 
>>> visible
>>> to another CPU running the ISR handler right after enabling those.
>> If this is the case, shouldn't we rather use READ_ONCE()/WRITE_ONCE() 
>> where
>> appropriate?
>>
> To my knowledge the READ_ONCE()/WRITE_ONCE() only imply the use of 
> volatile to access memory thus preventing the compiler to do weird 
> optimizations like merging store/loads, moving store/loads, removing 
> them etc
>
> They don't imply a memory barrier.
>
> Some systems need a memory barrier, to emit a "fence" like 
> instruction, so that the pipeline stalls waiting for the store to 
> "finish", for systems where the writes are posted.
>
> Regards,
>
Well, for the READ_ONCE() actually I'm wrong, it's overloaded for Alpha 
and arm64 https://elixir.bootlin.com/linux/latest/C/ident/__READ_ONCE

-- 

Yann





