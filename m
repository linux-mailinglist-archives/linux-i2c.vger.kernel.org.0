Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACC1784410
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Aug 2023 16:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236675AbjHVO0i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Aug 2023 10:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236665AbjHVO0g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Aug 2023 10:26:36 -0400
Received: from smtpout30.security-mail.net (smtpout30.security-mail.net [85.31.212.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE46CF0
        for <linux-i2c@vger.kernel.org>; Tue, 22 Aug 2023 07:26:31 -0700 (PDT)
Received: from localhost (fx306.security-mail.net [127.0.0.1])
        by fx306.security-mail.net (Postfix) with ESMTP id 754A835CFAB
        for <linux-i2c@vger.kernel.org>; Tue, 22 Aug 2023 16:26:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
        s=sec-sig-email; t=1692714390;
        bh=nQHsmXoP4bOEqJsZBNT+Dm8XXBzritveYweE0sr9WWM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=RpsWsnjv0SVy1aa/IboGvMpl0XtVHeOzv8Aq/MAL8+8Gl2BN0gsIN1YAsFUqK3qxt
         NEq6z6u+W6H3g2PnyjxhbDJsqRerB3UK9c9PfOSBhGhDn21ju00xEwW4zMH4CdGj+4
         tIWVD/b737FvvnyVKZra1nKDGZaRUDpjzBiQr6aw=
Received: from fx306 (fx306.security-mail.net [127.0.0.1]) by
 fx306.security-mail.net (Postfix) with ESMTP id 5A98035CFA2; Tue, 22 Aug
 2023 16:26:30 +0200 (CEST)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0105.outbound.protection.outlook.com [104.47.24.105]) by
 fx306.security-mail.net (Postfix) with ESMTPS id E51A935CFB5; Tue, 22 Aug
 2023 16:26:29 +0200 (CEST)
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::5)
 by MRZP264MB2906.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 14:26:27 +0000
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f704:3b18:55e0:64ca]) by MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f704:3b18:55e0:64ca%4]) with mapi id 15.20.6699.022; Tue, 22 Aug
 2023 14:26:27 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <11614.64e4c595.e4874.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzaHwymJlXTxE2ewADtCtjHRwCwReR4PZRI5h0KsWOZ5heRVe0VRHHuu4HyLHS2GT0MJuZ57SZckNQL8qYXgN9dmTfTj0QlQFSClK6JPFcaaRTQzWz0n+o+HHkn3FmUdBq6DiQdVjiPFkWJY8k46KilS+ToxReOXNZi64tZyhNK65Pp52T4sWtz0zVtC4ZQZeZ9KLrYHEg5c18UltwLG9iqVS5UWrVjK/qkeaiKWbr8JdBfsENJbCu4sROtsQ7XXxf364B/pfffuDbqSKDtgYRXEIKb2uAeH6+A9fvWQTeviKT1BSuHHGVPuQxteWImgm0trjPmiuEYXgNpdFRTPWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRmf+MLoLNEDdzDFNHooBq4jGANn5SvCNt5NqF5pSo8=;
 b=gS8BEjrPc+J0zHRchyrB1oA4qLVxy8DliLjDKNtcAM9UWoh6qGgb9pOSgxotaGnWY2+gh8ba2iCYiy4JvNC1WFyx3wHXBYHsQprffctWRts2aGOYjMjY6ZoHmQoop9wHbl7PYiaXb9Hoyq41uGsNWHmj0bUT7vXNu4BNn6rq+QtW3IOzbI2xhIMj3tPvfns6CkYYxmeMApPd73uB4SMAQIIIdyXDtFiKiiXE1Denpv/20BbMoY4l/NR46fXtPT7xy9WiWr/k0F1pNSncUKH4U5ZD9CVw3eMvqjbO3bb0fbBK0EIEVuuFP+gXe6jAxHfer5t/it8yQFkYeWT6jeJALg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRmf+MLoLNEDdzDFNHooBq4jGANn5SvCNt5NqF5pSo8=;
 b=UpQBIFdnAp01n2LHLTiZNqc98m0aajvQV4Vt2IcB5WAreMHez8OIGQ8XOhVbctZ1jiHsBLN+rOyAsIhXVsE+v1iNvdT+MffCx4NE3OTVpJhmYiYGbYWkcZErPraXMSx0sa5219Xwu4KYT0JQoylI1O+h+EyLK4aLKrSywNFVXRVMhzCl8wVh7tLBxc/Y+1p/Pn/IJMkukpw3XmB6dx5jhPQLoS2OUBAS0kjbQ0VxNWmiG4U9MYwe88zGiaahEympS6RY05jFNNWxQwsAyCaw4a6fBoeNaBWkN5JWy2noiY1NK347YS6HbkMEBg7THtl13M/JR2Dn66zNU20nr7L29A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Message-ID: <c388a776-4d1f-13a6-e682-a47509fae4e2@kalrayinc.com>
Date:   Tue, 22 Aug 2023 16:26:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5] i2c: designware: Currently if the SoC needs pinctrl
 to switch the SCL and SDA from the I2C function to GPI
Content-Language: en-us
To:     Yann Sionneau <ysionneau@kalray.eu>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230822142513.7518-1-ysionneau@kalray.eu>
From:   Yann Sionneau <ysionneau@kalrayinc.com>
In-Reply-To: <20230822142513.7518-1-ysionneau@kalray.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0002.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::20) To MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:13::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1890:EE_|MRZP264MB2906:EE_
X-MS-Office365-Filtering-Correlation-Id: 706220a4-c7f0-4c3d-0ca8-08dba31bc54f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nF/GmIThyCmZ9f+bkpT5SYgFILxjZ7+plGTTaTKJ4IV6UHbtNxk6h2zF6jnzQvuO2B4l0/gHWrfwnYxCj80SRnfu+yHBUi35vyhIWfDt3eF3It+jnl+byi1TMy+DQOy1Wgu2gKZ182m9QMDe0ih6oBGBq/Sx3ExR2tAsk4RXiqY2M2FeH+5Nkx2xpx/lzq9AbDLOd72q6o3rdu7eGcLtjDwnD47zioUovZ+Okhs9bAfnbDVDN0C0/tuSGvporjQYH2Bg9S/FwQMczpiu9xK2mW6Q37EQrWe1eAhHzAh8Vgzxqqg6NwgEu0J+PNnm9+AG0Tlwlj3uNtPTKNPogJudwYSziCj1ns9zE0EYZmXhANo5+SUQvubx4Kmj75HlCf3OtLao7s77RV3MejJAKmA3QI2Q1dGHmpprAeSdXFES5NjcJrUpR3vKnPXdA30eazFezAtz1r5p4NcxhHgrOvGOIXsSYFFoCbs/0SegsMTGn53uJChL6RYbDcGg4p44x0u5qq+4q+l0fF/0IZZTX/AQOmGAXnyJSfJgTYQVgo6dR8+ab/4usdw0CrWPlNP6ALKF0WRmpd195Gz9ElW71UGo/yja5pu+ERWHCGEcqjZxaLiZ+GDONmhM4UFdsXzyUVhZFxREe/jOyy96vOAfIu1GnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(346002)(366004)(1800799009)(186009)(451199024)(66476007)(66556008)(6512007)(6636002)(316002)(66946007)(110136005)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(6486002)(53546011)(6506007)(83380400001)(2906002)(31686004)(31696002)(86362001)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /Bo2s+r13nTqNjInxOlOx/GXx401t7bg53VblS5HKjSaFrdH9b8rFrkRuwClmE5f9Qtn73RXmwNxXp1BCXXgF7W8T6LePc9yadyAT8aY0LeFViuWZwSiVhM/nAjqSkk2nPC6hBoG4HNeDQdr4S05mTN0uXc/waowv0FrQySD4GOd/55eTCRC+KM6/ksd7g/Pgac5W/gX0njKg3Rq5mvLS/bIGpKixhGRVMrHzj3MAhwBbyeMKfiJrKCVOZJWqnzxOI4ZbUdyNbtPc/RGlb0/3w166620ky5ifj9yZHGHNdr4m4HEfHi0XpFs/7IamH5cefk5NRhWk2fIUhVUx7g8K1V3PDKodI8FCmGY+QDImofL24GRwI1IzedGOqkjbyDQCwMpYH0M3EyqOoW0ANVOOmsAP9aXkN3E1nPAc7C1Nyxklv7/qntKiIyHeJ3N8JOJzXG2VYLdz29nDDrSFSuamEzQn327biwEKnNZ4FXP8CBKuVDRvvhRyNY6hkN9HQixUD58sZFkj/8f6i9W5tDzfLSibnGe1kF1m5jiFOM0N6mm5MJlA1L0FnQldyiaGIBGtSw+vQ0h4bC/eZnk5Rd+G7GMlSs/XzHY45S3TKh+TyJHt2U67x7l/tQ66OHbllvQnVoixG8MIMmM5ltcCRkOqHcmD7nzq31/fQfamI2dGPWFodpo7/Gz4i+sfo+iswy+cJnlr1r3Uu/3JNdxtJk78dZu5ddjZyTeeXQ8bSwyAAvz8W0cpC42sWOTSpYOrgUw3/2ntuUIxysyBTX6gd9IMAJDWx9QXxNqyc0fWsa/74MORm/h3gMRRIiIVTMT3FTjt7fDtbt6J/X073PzK5F5wob1LLnK7qPAS0ewcweOpc+5OgLUr9AI06R8u5U8R10v3tP+Fr/zyXMIFxKxBsZH9SA9RbCCZI5E06lPNK9TvqTZ8DAFdlVpxOQfpWahmQNY
 iAKjGMNp68diHpyntYF8dsIZbr9a6lndu/FmxRzqykszEehem6il/ROhjVaRHKtndpEpnrEOJO2wymzzDte/6Cfol107CWqROYOjvhmMNA4zZj/uCaRVNeffn7cqoqLnlnr476kC6RAIcImkS73tra8Ce+oI+dkm7rdX8tUnDlPzV0/kWZlu2MTwSP+oYeE91v7aH9yn6vutnlRZCNFgahmmcVxd8NT/eBOPQ2aMzI4MNw2+rj3YV7INA/CIE89vGznxQfHwBcuRMuAkCnlFA5xSIGLnV90vV5c8af+dcvH5MMT0Fh6LYVgoJOf3i5Q9HQuk1OWCHbzfVOhhJ3DXUDxBP9vngD8qaBQFnPg6FJvuxvBMpsMoZdULNHHahB2TTDvpAZ/pnTF8jX3pmmKtCRphiE2MPYfM2vL350edROlqFgcdcBU0LIu+HqnfG8BNapV/8vgKdodgEaWtFg0qNZKnn/U9Gye/0fUTZwAnHc1EAB20FVtr2NqVLewvDvkF5gZ5wgcG2BGTUWuQKgcNbN1aam3RI0JZwmhNaHpGVcR1uv+ruULg5CfGK6a7TNwjtWxyW1DLdpbTaFjs+sfYGPiqDz94ggI/kaA8IYmSfwzj2TDAxQQ+bWQGBh/Ci1lyw+MkM3q3C2o/oon1wizelw==
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 706220a4-c7f0-4c3d-0ca8-08dba31bc54f
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 14:26:27.3877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivJ3iHweKzJNl07CsO1HrAyObn0KUem85WxJuQvT1+X0k0vA2CmwhTgsqNf6+hH6Em1vel6nuJoEQc79eWmwSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2906
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

Subject seems to have been truncated... I'll re-send.

On 8/22/23 16:25, Yann Sionneau wrote:
> scl-gpio = <>;
> sda-gpio = <>;
>
> Are not enough for some SoCs to have a working recovery.
> Some need:
>
> scl-gpio = <>;
> sda-gpio = <>;
> pinctrl-names = "default", "recovery";
> pinctrl-0 = <&i2c_pins_hw>;
> pinctrl-1 = <&i2c_pins_gpio>;
>
> The driver was not filling rinfo->pinctrl with the device node
> pinctrl data which is needed by generic recovery code.
>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> V4 -> V5:
> * put back `else if`
> * reword the commit msg Subject to add the `i2c: designware: ` tag
> * Add the missing `Reviewed-by: Andy Shevchenko` tag
>
> V3 -> V4:
> * Replace `else if` by simply `if`.
>
> V2 -> V3:
> * put back 'if (!rinfo->pinctrl)' test since devm_pinctrl_get()
> can return NULL if CONFIG_PINCTRL is not set.
> * print an error msg when devm_pinctrl_get() returns an error that
> is not -EPROBE_DEFER.
> * print a dbg msg if devm_pinctrl_get() return NULL.
>
> V1 -> V2:
> * remove the unnecessary 'if (!rinfo->pinctrl)' test
> * test if return is -EPROBE_DEFER, in that case, return it.
> * Reword the commit message according to review
>
>   drivers/i2c/busses/i2c-designware-master.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index b720fcc5c10a..30b2de829a32 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -17,6 +17,7 @@
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
>   #include <linux/module.h>
> +#include <linux/pinctrl/consumer.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/regmap.h>
>   #include <linux/reset.h>
> @@ -855,6 +856,17 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
>   		return PTR_ERR(gpio);
>   	rinfo->sda_gpiod = gpio;
>   
> +	rinfo->pinctrl = devm_pinctrl_get(dev->dev);
> +	if (IS_ERR(rinfo->pinctrl)) {
> +		if (PTR_ERR(rinfo->pinctrl) == -EPROBE_DEFER)
> +			return PTR_ERR(rinfo->pinctrl);
> +
> +		rinfo->pinctrl = NULL;
> +		dev_err(dev->dev, "getting pinctrl info failed: bus recovery might not work\n");
> +	} else if (!rinfo->pinctrl) {
> +		dev_dbg(dev->dev, "pinctrl is disabled, bus recovery might not work\n");
> +	}
> +
>   	rinfo->recover_bus = i2c_generic_scl_recovery;
>   	rinfo->prepare_recovery = i2c_dw_prepare_recovery;
>   	rinfo->unprepare_recovery = i2c_dw_unprepare_recovery;




