Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2957A8357
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Sep 2023 15:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233952AbjITN1b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Sep 2023 09:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234828AbjITN1a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Sep 2023 09:27:30 -0400
Received: from smtpout140.security-mail.net (smtpout140.security-mail.net [85.31.212.149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDAEDD
        for <linux-i2c@vger.kernel.org>; Wed, 20 Sep 2023 06:27:20 -0700 (PDT)
Received: from localhost (fx409.security-mail.net [127.0.0.1])
        by fx409.security-mail.net (Postfix) with ESMTP id 8868C349801
        for <linux-i2c@vger.kernel.org>; Wed, 20 Sep 2023 15:27:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
        s=sec-sig-email; t=1695216438;
        bh=lMF+FU4AF3esrA6x4Mm2RkwNVcWL04l0saaq5bpSPfo=;
        h=Date:Subject:To:References:From:In-Reply-To;
        b=jOY9M7/z4UnP4FpGskPTuQLxzvCx2QDFMImhGGgO9sq3y500b8hlk9TlFrx0j9jfX
         bd6hcD9ObHN6qk5ds82V1NPyjnq0Y3IOf3KsiFbxQdmgArF7/0/ccXu4U03CZGsKXX
         PwCrZH8D3u6LQZhMDUxIjNml5XzIKfK7ZPnSU38g=
Received: from fx409 (fx409.security-mail.net [127.0.0.1]) by
 fx409.security-mail.net (Postfix) with ESMTP id 3AC8334973C; Wed, 20 Sep
 2023 15:27:18 +0200 (CEST)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01lp0104.outbound.protection.outlook.com [104.47.25.104]) by
 fx409.security-mail.net (Postfix) with ESMTPS id 5DD953497DB; Wed, 20 Sep
 2023 15:27:17 +0200 (CEST)
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::5)
 by MR1P264MB2339.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:34::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Wed, 20 Sep
 2023 13:27:15 +0000
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2a88:7ccc:780c:c9f9]) by MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2a88:7ccc:780c:c9f9%5]) with mapi id 15.20.6792.021; Wed, 20 Sep
 2023 13:27:12 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <9268.650af335.5c40b.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfRB1t9pDYa2gBAJ+Dl47OWMPLAceLKFxe+ajwQBvdtr+m7tFoKNATZUYLeRM0CAEu+VoPN8VaU8ye+ZlcghKfDs3D/4gMWpVbdu4Xzv2YK5ZOLfhoHwUMpwhqMjRlrrtLeyC5Ssh6PJApcc3yhphkBk4qEKOgctjtF34YyOOCH6vTu9G6yMpATgUgjhfea7Lszk9M3E3pxU2h2DpmyF5g+iJXynb0Uz/eXlTA4VldeNdmsP4AFfuTdR81KjJTw7Jyla559PkD7HAQ4gdPUNkc44sTt4C5w2oKY/Vcg6uFs7Rkr2x5g+D3GII6NHX1LXtqhNxDIy2W/BEBiFxidMIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdeIXnZKeDVt5OwpEBl45dsK9Df5W0U/HFO8NYo23Xg=;
 b=MLTcR4k09PuhmxPjLkUYXoaC2CykGOEFfNQqXPOPiOuJUgn/k+O+a8YAqb9zHQrkBf99wK4BBtJidflk50BX+XV7ve8rjrzqNl2XHEE0ryCMLbaQXLE/jQFuHb9ZGxdGgcMb4KWIn2YAyUjPSpIVHgYipEkt9IG3ACgYL6Gs0aa6Qw+L2Ccor6HufQkpeyzl0O5wyFlWAhhM73+CHB5Clo0hH1WKsQEkwg9X6KoS/Jc6od5pImdU3yAahXWC3p6mjHrWfDs3MH6PQmqGeuqt5dJ2xoV//ZnAIE84Uv5CihBsp9dz32judY24dcuZ/06UgmzdkNAQyxDNezCtvHwx1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdeIXnZKeDVt5OwpEBl45dsK9Df5W0U/HFO8NYo23Xg=;
 b=unLQWY54uMTGRsMrdhlQ3/ibGIpubu8buvjizsuwqhxLCs0lB/fae1NSTAaMgMyYFFIMF5eJNkLbDJKGO88etiKR0l8XcVN4WolLWQW1MW3SGNRV0VoJPbMoYwpbaX4N7EAo0z7Z9I+wCOe8Mh9C686JNeD6pA/+8IZsddUG9b3bTi77j4vHGpKq8X8+np4CJx3YjuO6fQbJRcc5HdTrLq1krNSeEZygPgqOMXf7eG/61acjaJBlXKoE+7mRWed4VE2JVX1JzqtPFJKWkLwh+/uZ4OPB6UuqxSroim0NeT5W/PKGbaC7UuTZRBBe4guo2LOh4WUAgaArn+tP8756Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Message-ID: <ba6d4378-b646-4514-3a45-4b6c951fbb9c@kalrayinc.com>
Date:   Wed, 20 Sep 2023 15:27:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the
 ISR
To:     Wolfram Sang <wsa@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Jan Bottorff <janb@os.amperecomputing.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yann Sionneau <yann@sionneau.net>,
        Will Deacon <will@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <xxnggfauhkfum63p5bkgxsu3m5odyjda7pnwpb5ocwf4gez7fh@4lu6qyqy6dvh>
 <37e10c3d-b5ab-75ec-3c96-76e15eb9bef8@sionneau.net>
 <v4hdblxwhl6ncdfxre5gyrve7bgdsorfqpqj53ib6q4tr7aguy@4kfr6ergb3jn>
 <9de89e14-35bd-415d-97f1-4b6db1258997@os.amperecomputing.com>
 <ZQlwC9TCSwWJpuxy@arm.com> <ZQl1zwVkx9n2MPvr@shikoro>
 <da400d3e-a357-1ae8-cb92-728cc4974b67@kalrayinc.com>
 <ZQm1UyZ0g7KxRW3a@arm.com>
 <cde7e2fc-2e13-4b82-98b3-3d3a52c4c185@os.amperecomputing.com>
 <p7wl7fk4cdyhvw2mfsa6sfc7dhfls3foplmzwj6pzstargt2oh@33zuuznup2gq>
 <ZQq2cT+/QCenR5gx@shikoro>
Content-Language: en-us
From:   Yann Sionneau <ysionneau@kalrayinc.com>
In-Reply-To: <ZQq2cT+/QCenR5gx@shikoro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0197.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36d::20) To MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:13::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1890:EE_|MR1P264MB2339:EE_
X-MS-Office365-Filtering-Correlation-Id: 95fab514-f22c-4066-7585-08dbb9dd4c89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hdzftqNsu7K7pLdNZei0cKK2BRj3/KLNPSMNhQ13k7IQorwMeFv7o1fsV6r84NV8jJCOV/G1JuuAh+q5zRXkm7EtleTtNP8LDpjSOw1JWjIr1YRnOIUDGOxXPsj011c/U6rm+TYt0kn/AObtzkjuzlSj2IaO0lCBcoet9re7ZEbXYN9vXOx2xAa/1e/iA8g9efRbZ4bTArq92ihKuNtr8cpi+qBxUhM7YymMNxoCiMiexsmnL8gVgea2P2eNFPwrJQuWlwWoAj91xoBJzbZYuNzvcvYQREy0Dws2rdKZI3Jl6PBUxhGb8gaOxdxqkgZYzmIGceXoM54Drd5jhwZeSvlQdz1oBt9Cax+o616VbZDVFz4D/gvBooYOKTh0JvCMnU+Ax7FqMJUObMHWzgJ0Q5tIwce5eD+o2mi3kd5LAo1mrvHJxow6hXWHUd3B98tQ5Z5n9vA0CgSYwMCG2fN2FpCnthukvv55bprnYykiJ2WBGuuLNm3bVqvt71BtaiKmFOZPz7HGMWA+BQEO9Y8VEfrR5tTYEK0NEajtYaHa/pZsg/aUYADW2vb/laRNjhAHVr27vaH3HIbd8XsKoS0SurKf0YpdaCo7wbqXq85rXldOZrYsrmoBfyUx9ZXv7lqLp3b0NOLdU3jd0bOcehkCxkC8LvcjH21ZzQOb1QgL54w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(346002)(376002)(396003)(136003)(1800799009)(451199024)(186009)(6512007)(53546011)(6506007)(6486002)(83380400001)(921005)(86362001)(31696002)(38100700002)(36756003)(2616005)(66556008)(110136005)(316002)(66946007)(7416002)(66476007)(41300700001)(31686004)(2906002)(5660300002)(8936002)(8676002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GdVyjF7Ne+lUCTyLzNKZB21/KnEWw0+BETEUWZMAxxdIwXksdpOhw2SF5JRknk1aU7qjESCphJ9ZxGEDzFc/Ot4kEVmtHhp44I9mR6UCyvDJHBt7yp4bajkMqBMA7KSzKUBySNb8BoH2FwxBb6IVCMKOCjde7DVM7IP0MXzMbZ4tz8xs1SIzKMf0VDjFysf8JOlYUKMb/RpODG8EcXXA3wOlQjspFnZBRX283lSEn1jtSsUuLL6ln46VpXLcKuJioZfbVK54aHYCvrO5qm+kYMxUB4i4l2rODf//8zLaOw3SyqvWkgE43qIw+j/8h++VNW+9Oz9u/6wwKdJ4Y3hoHGEE9NrBkPe3gtBRDTFLchpIX8FQ4IMIyv0bzAQYPJTRipSSMvPidAdPRIc3/HHj9ZfWYnzdnwsGULl113JWCV5N+n6moA5laDsIprlnz0oG7IlGKD8OA0yB6eTzThbd7WWLHWSfn1bKmGLa6H4A1eMAa/2zFeg821SXrHrKjKt+IbWjKYInyeQ5t09IsJSt9nceTiKVvfy5ugwWpx5N5V/sM5iPkXk34NVTu0zTcIH7Ggg61gqKOWJVC3TLnok0bS2kM+w/FpNF6mAaO5VT4G/UN6PCiIz3FCkBWVMVp9aRYB4riQnCBG8Ul8s9COMq/ASSJoHQu4BcSLGEYjlcUKFqyvMjjLx2KGgNDkPaiz1DQha75TFhalzMD1bPX9nvBHZJIEIMNK9etIW8spn/eYPitEYOEDJnyvwmcJainkyVAFplmauJY41AxaM95ITYIP/6tve19ShpX0BOD5UwIAebU0zKKELXOb8l2rVP+OTTyZ6BO/DKu4DZMP68Zj13vFrGYJWndB4+fUhIFwoTUlAxf82XSGlpuExqIm8i0od/nWevFCPF1l1wgXn7mYNXzRfQzbpH0bn5U9/ZUSsHqqAryFsuceZLn7WOKzoIQ4ea
 YU86vKgzXmbMKSw7idfzJsY0gUVeo1vpAYZquhGxfuhmvJH14C9sTkOH66HoaKp12KpLrdmzSoZI4mPV6cvOXaokGVNQgJGmZ8NAHa16MdXzwge9n8hDoVkhKeGU/blXJz3vdpuY+8Vn82727nJjv+Al8+QUY/WaJcgqLXy+Bf8nj7MQRriR0/Lj79S2oBIfwCZYonqZg0tXRs4H5DUh+k7tZcNCWIgc5GGuStH1Wc7zId4QtzTBz6j1mIW+smLTr8XYwUmVuXpmi75aaz5npvn4iZ1DCHEPOcsGOlzf7zxtcieygH1SDWEsVdjyU1PLgv0aoNoJ0vKPpiTRaPvlrXc2isblxsjqB70Q5+GuXlzDq5uWb9sjE8uV1LTqJo1M281a2jPDapsoJ76vzgfALCCjg3YVYp8UsvbeVArcg9TVJz+LGrm82rsURsqcksdkXL1IYrd/NESnafNCoKvMrHLZ+OctC0YsTQX+1Yyt0XH1c8vtmjO/49XOcOy2G6S1Wr+aOENwjVvscgqGxxAn8P1f1LON80gZz9vbYSFCVXq53F4nFIrQstjL7kBXa4+QdpnRJ0g4Irz9ZY+wu7WtGcVTiQHKaKbif5yGWFY915KN3yv2wHy6ScIhuqwKhXvqpD06irPL3hLVbEtSw/CW7lipRuYLjs3Kdelkqfr7wf9wqg+r65K6wT+XfVjAA6NACo/8/e7MTBZCcOjAOHiFrQ==
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95fab514-f22c-4066-7585-08dbb9dd4c89
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 13:27:12.7361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2nZxTdRzwQSq4ejnKDAqrMYfpj6oJVGQK62xw4UdVafJ3uZ3YFvFWEXya4ODmfkJpFYpNBzvPHd7+sB8J5hGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2339
X-ALTERMIMEV2_out: done
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 20/09/2023 11:08, Wolfram Sang wrote:
>> same thread." [1] Thus I'd suggest the next fix for the problem:
>>
>> --- a/drivers/i2c/busses/i2c-designware-common.c
>> +++ b/drivers/i2c/busses/i2c-designware-common.c
>> @@ -72,7 +72,10 @@ static int dw_reg_write(void *context, unsigned int reg, unsigned int val)
>>   {
>>   	struct dw_i2c_dev *dev = context;
>>   
>> -	writel_relaxed(val, dev->base + reg);
>> +	if (reg == DW_IC_INTR_MASK)
>> +		writel(val, dev->base + reg);
>> +	else
>> +		writel_relaxed(val, dev->base + reg);
>>   
>>   	return 0;
>>   }
>>
>> (and similar changes for dw_reg_write_swab() and dw_reg_write_word().)
>>
>> What do you think?
> To me, this looks reasonable and much more what I would have expected as
> a result (from a high level point of view). Let's hope it works. I am
> optimistic, though...
>
It works if we make sure all the other register accesses to the 
designware i2c IP can't generate IRQ.

Meaning that all register accesses that can trigger an IRQ are enclosed 
in between a call to i2c_dw_disable_int() and a call to 
regmap_write(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_MASTER_MASK); or 
equivalent.

It seems to be the case, I'm not sure what's the best way to make sure 
it will stay that way.

Moreover, maybe writes to IC_ENABLE register should also use the 
non-relaxed writel() version?

Since one could do something like:

[ IP is currently disabled ]

1/ enable interrupts in DW_IC_INTR_MASK

2/ update some variable in dev-> structure in DDR

3/ enable the device by writing to IC_ENABLE, thus triggering for 
instance the TX_FIFO_EMPTY irq.

Regards,

-- 

Yann





