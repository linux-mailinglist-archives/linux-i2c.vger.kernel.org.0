Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 364BC5B8ADD
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Sep 2022 16:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbiINOmu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Sep 2022 10:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiINOmt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Sep 2022 10:42:49 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F41459270;
        Wed, 14 Sep 2022 07:42:46 -0700 (PDT)
Received: from booty (unknown [89.101.193.69])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 36ADBC0002;
        Wed, 14 Sep 2022 14:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1663166565;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4WXxl/3il33m4nE7c2jycH90WwZ4uMZDzmWdAS3zWVk=;
        b=mqu9SdN9WKBBEMttgySICNgnqnzkzYN4fzlbyZRE7Fj8rrMVqChCgPHD2aSSoJMqJ3ArsD
        zH4sB3L96DydkXdedNdCfqVd4rECsO254wCzeqbtHw4ihpqfa+2dQuyKxjLoaUWYTcyIRj
        TXWJVYC7GantTOtmpvBg8j1r1zkxHf7+Vs1L/n3zxp6oF/F0hsptH64PtyQZ4SzgG6MODP
        EqHzTPzW8NuO2wawCrY06iL6rEWYY2fVvA+/6DnisHrJxZfPsdl1FSJILOGA65SMQSH9y/
        iE5mmkHFTdKMZV0+fcadIcJbxo2C2vpJaOg3bJEGnhQT/qirvX8NwUoVFdJ4AA==
Date:   Wed, 14 Sep 2022 16:42:42 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] Documentation: i2c: fix references to other documents
Message-ID: <20220914164242.58b3b360@booty>
In-Reply-To: <20220913100552.3080-1-wsa+renesas@sang-engineering.com>
References: <20220913100552.3080-1-wsa+renesas@sang-engineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Tue, 13 Sep 2022 11:05:52 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Similar to commit fe99b819487d ("docs: i2c: i2c-sysfs: fix hyperlinks"),
> make other links in documentation consistent with the preferred way.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
