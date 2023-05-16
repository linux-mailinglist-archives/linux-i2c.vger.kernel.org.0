Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01FC2704393
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 04:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjEPCqf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 May 2023 22:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbjEPCqe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 May 2023 22:46:34 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224335FCF;
        Mon, 15 May 2023 19:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=hBtJ/TjS7eImEOKAiFTF/XY7fRtSm7pKdcysreoF8hg=; b=KM/0UF1UYf6CiCZA0TAT3ZJGtw
        46tpxzQm2IO9SPRmyTdwLpfvevXp+1byMyoC3PPXCMzB2JVtybc1TFK3Uz7SWJtYKANNIpgTZAe1d
        fn3ZaEmNf1KdEMndDXHFh9ohZUFb/CsbfQRt1f8rp3/+XOeGTBs2iE5a2Vx4h0yGZGpWBFn7RcFyI
        LVCV5Cc4qhaL0tPVpF+AtPpshTx/Mq0RxkX45RirIRvBLyCKKwpveWnMA3HqAmoxLSc7penNXfqwU
        khwU97uU8ghHs2jNDEHwGF/AGcfAxatKmrMU2UrVI3SSCwTM4knE/DXGj1HVigI6dUdR7Je7QgDSJ
        s7VPPDkA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pykhI-0002ln-JZ; Tue, 16 May 2023 04:45:56 +0200
Received: from [136.25.87.181] (helo=[192.168.86.26])
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pykhH-000FZ1-Mz; Tue, 16 May 2023 04:45:55 +0200
Message-ID: <cc842fa8-5ab0-daf4-22c3-055df4d06cb5@metafoo.de>
Date:   Mon, 15 May 2023 19:45:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH net-next v8 8/9] net: txgbe: Implement phylink pcs
To:     Jiawen Wu <jiawenwu@trustnetic.com>, netdev@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
        linux@armlinux.org.uk
Cc:     linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com
References: <20230515063200.301026-1-jiawenwu@trustnetic.com>
 <20230515063200.301026-9-jiawenwu@trustnetic.com>
Content-Language: en-US
From:   Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <20230515063200.301026-9-jiawenwu@trustnetic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.8/26907/Mon May 15 09:25:12 2023)
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/14/23 23:31, Jiawen Wu wrote:
> diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
> index 6c903e4517c7..6c0393c19b83 100644
> --- a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
> +++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
> @@ -80,6 +80,10 @@
>   /* I2C registers */
>   #define TXGBE_I2C_BASE                          0x14900
>   
> +/************************************** ETH PHY ******************************/
> +#define TXGBE_XPCS_IDA_ADDR                     0x13000
> +#define TXGBE_XPCS_IDA_DATA                     0x13004
> +
>   /* Part Number String Length */
>   #define TXGBE_PBANUM_LENGTH                     32
>   
> @@ -171,6 +175,8 @@ struct txgbe_nodes {
>   struct txgbe {
>   	struct wx *wx;
>   	struct txgbe_nodes nodes;
> +	struct mdio_device *mdiodev;

While assigned mdiodev is never read.

> +	struct dw_xpcs *xpcs;
>   	struct platform_device *sfp_dev;
>   	struct platform_device *i2c_dev;
>   	struct clk_lookup *clock;


