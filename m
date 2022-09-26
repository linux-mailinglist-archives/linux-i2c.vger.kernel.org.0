Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE3625EB40F
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Sep 2022 00:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbiIZWCe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 18:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbiIZWCM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 18:02:12 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58176E6DF5
        for <linux-i2c@vger.kernel.org>; Mon, 26 Sep 2022 15:02:05 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id e68so8045949pfe.1
        for <linux-i2c@vger.kernel.org>; Mon, 26 Sep 2022 15:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=UWb8wOcddtfIJyUFHBW5IFK0MRMvmDGvIdsfGhwq6fs=;
        b=dC8LNQiZOc8Y9cleQx7I90Ilxgksx1StItiDqfDAw5kcu+wbT6Svs4BKe6de3VBEa8
         2Vz0EVtEAeXZQrz5wyhwgRc1V1hk3ZBnZN5xcRPZGY/PEC3WDGhqxxwUHRJQdJVtRYP3
         f+4j6TzqwFY0fyt3pnKplYB3IrwAqWudnuM18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=UWb8wOcddtfIJyUFHBW5IFK0MRMvmDGvIdsfGhwq6fs=;
        b=glVjgwy2Y1oWr2rRg2muMGSn2gxPuckxBDTyP2sCiz/KMVQdoaUx6EQP8dKoqxsmmn
         umW9LC3IdA0u+ZcAj1p0s1T1iEtReXQhy3jT5QmlY3UzfgL6R2bFLJ7geng7CgOF09Uf
         h0bJ1K+a68kzm1/fU78Hu4XhlDpwNcVwDmuI0HYgH4ONMJ0TrkA3pIf6K4JH2JcBf4ID
         9wFo3e4gKV35eRefsh2c5ZCuOl/k0lhf6+PweT4rohyhgqIyx6m7xNV903njw04HnzYz
         nL0m45bJvHs4AXaDoz9kAihktdmBU400h/sVlThtKY4D2cXQO3ECFExmEXoSQf+Q1U8x
         Xo+w==
X-Gm-Message-State: ACrzQf1Unr4nhxE2I27r08fT4z3plcA1VrOFcz1gCw3WZc2QFAcLZv3w
        73mdYpit8kntgLMK27RYL0T6TmiUVghheg==
X-Google-Smtp-Source: AMsMyM7++pwLxo9jbIU4Zan+KiWB3G+z82cHwCpvQIpOj2QII3T8ZRtHBoCOWvcGBn2icNismTMwTA==
X-Received: by 2002:a63:3348:0:b0:439:db24:8b02 with SMTP id z69-20020a633348000000b00439db248b02mr21383347pgz.425.1664229724728;
        Mon, 26 Sep 2022 15:02:04 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t15-20020a17090340cf00b001754a3c5404sm11444207pld.212.2022.09.26.15.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 15:02:04 -0700 (PDT)
Date:   Mon, 26 Sep 2022 15:02:03 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] i2c: acpi: Replace zero-length array with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <202209261502.AA269D2@keescook>
References: <YzId7dQGWxMyXHEU@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzId7dQGWxMyXHEU@work>
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 26, 2022 at 04:47:25PM -0500, Gustavo A. R. Silva wrote:
> Zero-length arrays are deprecated and we are moving towards adopting
> C99 flexible-array members, instead. So, replace zero-length arrays
> declarations in anonymous union with the new DECLARE_FLEX_ARRAY()
> helper macro.
> 
> This helper allows for flexible-array members in unions.
> 
> Link: https://github.com/KSPP/linux/issues/193
> Link: https://github.com/KSPP/linux/issues/218
> Link: https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
