Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAA0C738BDC
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Jun 2023 18:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjFUQpO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Jun 2023 12:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbjFUQof (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Jun 2023 12:44:35 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E3C1BF4;
        Wed, 21 Jun 2023 09:44:30 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-668689ce13fso2363888b3a.0;
        Wed, 21 Jun 2023 09:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687365870; x=1689957870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovx+jfZaH7V8FUChgciq0i3am8A77reL9nkY9HPtvCI=;
        b=oW1ObikBvNryJa3IQbsMIObXQjVKuU+Iar50y+rtYh0A7IRz+1XYqAoe1R0Uwwgy2r
         aLufJu+ujgaOCNBf18/9nfHEeXaf14QE55Wj9i37mRHMmR3DulOVIckWO3SYLIizeB4t
         ylzGvX19+gt0Qz+C1m0u41kS4iGnavFx27DmySmD8+mYd04IvtdIyFjlBjm81PKfgB2b
         TlcfC0876TQ906Q33bvfX1T8VM80AJi/b4s32YUX0pe3OCCvyBUCfNXcGw0DLrFAwl28
         vWXwLesHf4srU5hQEQn7VazrpIrdrsP9LCG1B8h7ihjp4XN7Ac+KqSo0+BDTOAU9aOEJ
         7oVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687365870; x=1689957870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovx+jfZaH7V8FUChgciq0i3am8A77reL9nkY9HPtvCI=;
        b=kmqQC4+g3A3Ob2EXSJfbR2dpmMqrBo92SkW6l8boBGYO8SlmZyCxwXVQXDM3kwawIl
         HhXNw3Aa4iKCkQ1wNCCaZ6RLzTA1XhVK32w879u7CgAeqrxZfarNla4SXQqUWnmaEhHk
         uuIFI41oyaBeT2R9mMSvbXjcRwL7AC2AzLdm39e+I1s61lMKZynnZhGpVN5N8qbLgv2j
         uR1uaeY9sCZ/TW+eouDsWK+1HTrEApWfrZCf5n8dxkQTdwOB1jiPuagbObUWsw+4G/Vs
         H4n+y7fpMnc796x02d53CrAgQrnJrl0XyDmKaPCX7eA0zD9dTPOgfsK5SlV0euFcC1qG
         Jo9A==
X-Gm-Message-State: AC+VfDzaRrLgj2yjNUCFawIBzZIEHGI+pzf8sT4jRelmYfLb5z637mI7
        HfFOpHsDa7fZDLvw4GFUTzw=
X-Google-Smtp-Source: ACHHUZ45oqsBtnqeZQhPpnjVYiE28xPv4RXfLxZ/e2KDRp7E0x5FpC9J7lmd1zTkwlwe53k51cNEVA==
X-Received: by 2002:a05:6a20:4288:b0:11f:4412:fc77 with SMTP id o8-20020a056a20428800b0011f4412fc77mr6379317pzj.17.1687365870107;
        Wed, 21 Jun 2023 09:44:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x9-20020aa793a9000000b0064fd8b3dd10sm3130533pff.109.2023.06.21.09.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 09:44:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 21 Jun 2023 09:44:28 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Rob Herring <robh@kernel.org>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mpc: Use of_property_read_reg() to parse "reg"
Message-ID: <c9e228d6-d8b5-4041-b50a-c599144c8752@roeck-us.net>
References: <20230609183044.1764951-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609183044.1764951-1-robh@kernel.org>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 09, 2023 at 12:30:44PM -0600, Rob Herring wrote:
> Use the recently added of_property_read_reg() helper to get the
> untranslated "reg" address value.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

This patch results in:

Building powerpc:ppc32_allmodconfig ... failed
--------------
Error log:
drivers/i2c/busses/i2c-mpc.c: In function 'mpc_i2c_setup_512x':
drivers/i2c/busses/i2c-mpc.c:310:20: error: unused variable 'pval' [-Werror=unused-variable]
  310 |         const u32 *pval;

because pval is no longer used.

Guenter

> ---
>  drivers/i2c/busses/i2c-mpc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
> index cfd074ee6d54..595dce9218ad 100644
> --- a/drivers/i2c/busses/i2c-mpc.c
> +++ b/drivers/i2c/busses/i2c-mpc.c
> @@ -316,9 +316,10 @@ static void mpc_i2c_setup_512x(struct device_node *node,
>  	if (node_ctrl) {
>  		ctrl = of_iomap(node_ctrl, 0);
>  		if (ctrl) {
> +			u64 addr;
>  			/* Interrupt enable bits for i2c-0/1/2: bit 24/26/28 */
> -			pval = of_get_property(node, "reg", NULL);
> -			idx = (*pval & 0xff) / 0x20;
> +			of_property_read_reg(node, 0, &addr, NULL);
> +			idx = (addr & 0xff) / 0x20;
>  			setbits32(ctrl, 1 << (24 + idx * 2));
>  			iounmap(ctrl);
>  		}
> -- 
> 2.39.2
> 
