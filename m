Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D52F77F85E
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 16:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351673AbjHQOH5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 10:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351690AbjHQOHk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 10:07:40 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A48DF19E;
        Thu, 17 Aug 2023 07:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1692281256;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rQqO36gNDNYTmXlOgLSSVeVJ96lebd5QYS7C6qKGB5g=;
        b=mhh6B5btWfTlejtjZYdSAW0YEvWXJnr1p9fa0BGHXUDbnplElZ3l281vh/xcDx8g+1JWqw
        KprV3m77TUDXPDy5Vv5g1Ad4sw/X6UMRPLZNCCH7enFSRF0Y/b9h9z9hIOjY/O8XB3M7hJ
        XjGIMaSUZVKCZl0P2n4MZYx6ZBj1vbU=
Received: from [192.168.43.126] (hen56-1_migr-78-240-185-16.fbx.proxad.net [78.240.185.16])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id 4354078a (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Thu, 17 Aug 2023 14:07:36 +0000 (UTC)
Message-ID: <476c8dab-1b32-b781-2d6f-4335d6de7f72@sionneau.net>
Date:   Thu, 17 Aug 2023 16:07:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/8] i2c: sprd: Add I2C driver to use 'reset framework'
 function
Content-Language: en-US
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
 <20230817094520.21286-3-Huangzheng.Lai@unisoc.com>
From:   Yann Sionneau <yann@sionneau.net>
In-Reply-To: <20230817094520.21286-3-Huangzheng.Lai@unisoc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLACK autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le 17/08/2023 à 11:45, Huangzheng Lai a écrit :

> This patch adds the 'reset framework' function for I2C drivers, which
> resets the I2C controller when a timeout exception occurs.
...
> +		if (i2c_dev->rst != NULL) {
if (i2c_dev->rst) {
> +			ret = reset_control_reset(i2c_dev->rst);
> +			if (ret < 0)
> +				dev_err(i2c_dev->dev, "i2c soft reset failed, ret = %d\n", ret);
> +		}

-- 

Yann

