Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6F87843E0
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Aug 2023 16:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235860AbjHVOVM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Aug 2023 10:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231804AbjHVOVL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Aug 2023 10:21:11 -0400
Received: from smtpout30.security-mail.net (smtpout30.security-mail.net [85.31.212.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A101CF6
        for <linux-i2c@vger.kernel.org>; Tue, 22 Aug 2023 07:21:02 -0700 (PDT)
Received: from localhost (fx306.security-mail.net [127.0.0.1])
        by fx306.security-mail.net (Postfix) with ESMTP id 922F835CFA7
        for <linux-i2c@vger.kernel.org>; Tue, 22 Aug 2023 16:15:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
        s=sec-sig-email; t=1692713729;
        bh=dPONjSDwyFdrZcd/ibZafq0Zw4s5J7evVM4mYa++PWg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=X3Yh20Rvsly+jZZBXvK1TF/fBffUiASrfdVtHOUDhc5roBgdph6qbtsddIP1DkOvw
         iWaXenCbkrWevcoh85wUYZhkVXaLxAyD6xEYSB0VKu82XJTp5BIXtqzuDZ6JF2OIWR
         z+ifLs4kEVirsjxAoxVI94Sf7fAt8Pj17sSasUio=
Received: from fx306 (fx306.security-mail.net [127.0.0.1]) by
 fx306.security-mail.net (Postfix) with ESMTP id 772C635CC5F; Tue, 22 Aug
 2023 16:15:29 +0200 (CEST)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0104.outbound.protection.outlook.com [104.47.25.104]) by
 fx306.security-mail.net (Postfix) with ESMTPS id 08F7835CFA1; Tue, 22 Aug
 2023 16:15:29 +0200 (CEST)
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::5)
 by PR0P264MB1833.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 14:15:27 +0000
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f704:3b18:55e0:64ca]) by MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f704:3b18:55e0:64ca%4]) with mapi id 15.20.6699.022; Tue, 22 Aug
 2023 14:15:27 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <510e.64e4c301.7f9d.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5EvTunH2Kyaf/Zqy9yCynk6QBKcMCycz1yXzpVd5cigpOXH5BuZHAAUvS9iwYMPMufJ3jiwPFzJProkyMWvkHVnHB8hIZfbzHXDI1y+7eadaZom5FUGxtQzHVCRyF5UWZ7oiBrQMf9hywH6qx1L0j++5Xa8dHvkt/xf9ASt5mMeoTBtMcq3+XD7LM4szFbpCJ/YTbxpSsYGS8JfzjhGIzOP8fhg821ogb5oTAb+WIOXo7PzE4sYaR2XbOV179KgbXy06RhoZvOIkYTWg3B7tuWM5rD1irLiWoju09Dmn2bPZnOEUMkIVgFg9bK/4c+X0PEG0OutS17ovcuFgZ7Pqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tViEHBOliVysKJyIiyMWdEpZ76rH9YPiEXjY/46p/5g=;
 b=CUArXPX5S1Q+ndj9sDECyUkog3hjtCv/PNeFbuSs6tMz4x1pD261RgFr2ZD2brNmj9xrcv9yXAbZbcgzgemAvOJg/ngCMA/uIE4e9Y9GfEIYVchrPczeGfZ0X7768qLMuVcubVjYneyuiVlFjNT6fVm0774GvypaK7n4sxCvchEkd7YuljBpCvwlxwAt4hgUM2nm64q0bzaw3L4w9ubUQpSbGSxlSd3/KSjz+TNl2c00anqK+U28DAFtOKzptrAlLdp8fFxbBfZOZYhDie7l7fER/cnhYof/ynatutpoOTMPmHMY1BQBWsvDPZXHIFQPey4vVHh49QUIv9EhboqXlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tViEHBOliVysKJyIiyMWdEpZ76rH9YPiEXjY/46p/5g=;
 b=C9mGDSbnaF3vmJ2LM+8h1riFyPVglEOOjG+LAGvqikhWa/ggdM6QDKt8N3ihz15MkcoSgGd81a5PISKNz0rENT+ZF7ptcEM0E5pXxoAhK9eZoqR9nOm0UOKe1RqtStXK/3X0Tl/7BHoFj1H5HPl7Bsoy5uk/Gsq9JnfMFI9La2wa1b5nLbAkr8LqQDJFqVc6t8huDuVHP80s4Fs2sgmEatAPTE4oqHVD8ENInryusN+926RW0Q66bszJ9cSpWoFbd5Yf8UEqoXASkv5K5uOayUat7Jcd7fn83bgskr7miQcl1I3FxqMctakeERWo2NNJpKmNZTdsCQJfagacJ7KcoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Message-ID: <b12f4f63-4504-e775-166d-9ea30dd97489@kalrayinc.com>
Date:   Tue, 22 Aug 2023 16:15:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4] Currently if the SoC needs pinctrl to switch the SCL
 and SDA from the I2C function to GPI
Content-Language: en-us
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yann Sionneau <ysionneau@kalray.eu>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230822131123.5041-1-ysionneau@kalray.eu>
 <ZOS3cI7RL443mizj@smile.fi.intel.com>
From:   Yann Sionneau <ysionneau@kalrayinc.com>
In-Reply-To: <ZOS3cI7RL443mizj@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::15) To MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:13::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1890:EE_|PR0P264MB1833:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c1e502e-2096-4e1f-eb14-08dba31a3bf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7h5PWgX9wTGDqM4usJ90O9nbrm6kSLgDP0Y8DE5rWsC3dibLjKu7GDQqN9bIIc7bszObaSubEDQ7oQSkUF01HJLcjmHchNkdWNlkFn4pLuP8IIar9i+Km48KHV00PHPWUyA0mbHU9RVvNvH4BqZ/qz/1NAo3ckiSev2+tIDZpXX6DEha829yjZoct/JxSYQYvBxos1TGpzhKkAUEutW5qQHUm2m0gBuC6jP97DikJpwUa84eoNqCWMlojLNy3BFaWG7pK2kG00wX1jTasTjG2jWjqwlyxDddnAhobRE9S7KfVQHoveIzm28/ERNOqJspKiaLjIZ1D9MwWE7qH/4WoqGubTHgNaOXPxOQ51xZurOdd+L4zQo5e25+8c5mbnCQlxXsn18TD+DAeM6Xv4jhJBtE6aDiIXsOZcu2ZbS3FH/3VUlrpJVm5jOtUD5HgyOXmyFtb1FATZKIj3bs68keHOjPrMrTrv4Ba7GPCEb0jPaShNDzg3SZRm7o9kkc2KvrW7p+Pymiw9/7IBTnDgx9MSVTJ6ScHy3s5zF3OPl+hzjxG0N92xghI3Ghsk8ZLrcOS7Rfl3Dg//uSu08y9n3y0R+iLbPGlnflLQ0FKX/b0wN3BM3dnT+CDcVggZ9aX53+Uo5wYQuLPhgTe5fs+QVv3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(346002)(366004)(1800799009)(186009)(451199024)(54906003)(66476007)(66556008)(6512007)(316002)(66946007)(110136005)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(6486002)(53546011)(6506007)(83380400001)(2906002)(31686004)(31696002)(86362001)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DUOKcdvIBJib40/0EYd2NbGWpaIyPeRdy2gTE6YG8op0aMfZ0HJu3oi8qUaWCZe/MLyS9CF40P/wsDXHqijRz+M1uVA/1PkYgk/6QHUmEONpCq9j60u5CjC5suOh+UEAsERjy2HNIP2kEVyAQe3iYQzMwJ4kVsPTkcfMCjvBqLwmexHf3rSakMVOAjIAW1Ye0FFWY8s4OLRG/fc643c/4uNaDzgx2HBMDnh8Z6Ss6lEX9bKSQAvhHkVIBoNcMxFGaQokb6Hq7GjGRGQcvNCqhw3Ch9OJJ1kLqmnziYzopKtOMnl6aZgSjF9keH8Fu3hkdfLrCSpSlSR6FQoJppfIjBCfv6iiYCZkTAP9B+PXA7uYNuewJ+JqX0QJUjCv+9vzT5J5BLSDyawe04rE1rvMzrrt1x3f0kDCixkQSrkgtmADknFYU5Af3TP4NIec52vCmfkT3rHeOeqI4FnWRPK22Mf5a/qvYYZmzfWNv98LDW9DiEBi8Hb1jogcQHUtgWwAMJw7y0Qq67xOIQwNv9BI3hfR7L9OSHancbPeWEEwoAsot1LMGqGN/0uXv91yJC30dZ1nsHpEPfWB6LF65T2sUC1eFwMnjdvtOO70WnQmqI61YrEgYVxBUcYWLIVC83sSUqmM16h0H10t6NtPsRtuSP+2Dz9ZAIKH2lZKIsfECi/9muGW5c1arB2Js2QT08+qyl4+8gYZH7d3NBpw1YgCnJ9qUEcyOPp71ou8Vkw7uCIHH7OLsOnShFsqawmMqipnwBaHYFMf88vtnJZucg6MMxrybl/pidid3p7p5CR1cLnl/EuQRcvQCklISfZnO1+RG3LqXpjunPCd74umtzIj7GiNPoGygqhwdZcw0oXvQv9T1e3dNwdTlKPCDYm6rD/dJIWu3ALMrNs1kGr/7sZ/bvc54PlREeNvepVWXuaSIw5phcP0HFUXBwOlP6KKmuxL
 agUK8AKztl7MoFWGa9IF03lcP0fiJaKbi8X9CFWz0Znx0rkjpUtqL8nYe9NRyZzel58XAUfSv2xMvq+vXUqwb64ggq437QOCAHI8cKJyRsytkyfFG5xLxe14WDOAK7wkhcsGGcQuPQNx+Hmk353WvlbMG8P5aeh66+UG563atLmPww/8qCmtW53Roit4LnR5gN+l4x/d2RIoWRWe1KVQTHXylCUTOhpVNeDHFpHhhRQicc6IlubciX73dvET15GgAem20GE8QGWQQnWjtnAUOYzfLxYaJBIFQQ/sXWmlbykLI5t/MCWJjevR6BH96yCftFnidTLcOu037VVx3XBh05pBNoDyv2T9skUfuKnxAfuPflFEi5RPiYS7SY9qWJEUtc2v7hghKyq15nHAFsBVo8mJYn74XCV4u7Tql58kpDQ7SsktA/f/7PkFPMWN5TMwZNmNyvby32jrwM9k/6iqPxZFencO/sN0NSjUCvZdkFRqhshpfOw0TlyGCiVYE2PKXKTPlSRv0vFZ+L61D8TiqLKu4ZxbnjVuor6jN5DOQHG5H+0dBQsBUPhMD0kKEiYi0ShC7t/ZcgdPMWrzbTzo8mT8zSsqV2QwdsWG6I+GCtLTO5fcff/7cB3M4uiA1FzYWJi6Qds/iFsI1Y5pDBn2Vw==
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1e502e-2096-4e1f-eb14-08dba31a3bf8
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 14:15:27.5353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4saZc4AFv3XlcmfDvZ5oc7CnRPOrfOZKXoFU5W+6oOEf4VDQ2V0e8qc54wGDAEesAOdQRLpmviBB3jssNxZIZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1833
X-ALTERMIMEV2_out: done
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 8/22/23 15:26, Andy Shevchenko wrote:
> On Tue, Aug 22, 2023 at 03:11:23PM +0200, Yann Sionneau wrote:
>> scl-gpio = <>;
>> sda-gpio = <>;
>>
>> Are not enough for some SoCs to have a working recovery.
>> Some need:
>>
>> scl-gpio = <>;
>> sda-gpio = <>;
>> pinctrl-names = "default", "recovery";
>> pinctrl-0 = <&i2c_pins_hw>;
>> pinctrl-1 = <&i2c_pins_gpio>;
>>
>> The driver was not filling rinfo->pinctrl with the device node
>> pinctrl data which is needed by generic recovery code.
>>
>> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
>> ---
>> V3 -> V4:
>> * Replace `else if` by simply `if`.
> You forgot my tag. Why?
Woops sorry, I am not used to sending patches upstream. I didn't know I 
had to add the ack tag. Will do it!
> Also I think this will generate more code and more noise in debug case.
> So, I admit I gave a bad suggestion in previous round.
Ah yes you are right in case of dbg+CONFIG_PINCTRL not set it will print 
both messages but just one is enough.
>
> Please, go for v3 with my tag (as v5).
>
Ok, I'll also add `i2c: designware: ` to $subject as Mika Westerberg 
suggested.

Thanks,

-- 

Yann






