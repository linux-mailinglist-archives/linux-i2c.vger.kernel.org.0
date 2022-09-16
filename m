Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 569525BAE2E
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 15:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiIPNbw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 09:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbiIPNbu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 09:31:50 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8991E96771
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 06:31:49 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id b21so21450374plz.7
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 06:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=KgBYor1Htf/vgvjRNDzZz0OSBXCS1g2qA2z8v/wMsdQ=;
        b=duV1RS8TM2EGZ6omH4ubcEo80bgH2kyZd5qyDXZXa3PhTBC8+KG+to4g1PhL106fEN
         2Ce5cVmi6xX3gbz38EE8qox07VoXA4Av+FZJ80wWOZ6UV6i5CZqldo0nA14gKiagdGWT
         bAcrvdodiN1cfiDHSyxQittJvsK3g6HcGnXF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=KgBYor1Htf/vgvjRNDzZz0OSBXCS1g2qA2z8v/wMsdQ=;
        b=u1XzRvGWDwVfblCM51pbPRz6Mb1S4dlMLumRsMSllXU4do7f+91GNmMpDZSl3Aj0DP
         x8sWqDj0ooR+slvXCAom4Gnm0hkQ97mPIaEFZuE3oC+k0PLchmmkWOwb1kOfsHXEJhxE
         fEomn0hSLfXWMs7ZPTah5vCVenrjeHwr1vgfUUwgTd5/th9Y3Tikz70oxwr8wMmkTWIX
         RLkF4heCgYwTdy621/Kv0AoJq58YGgErDeDfRvXhKOGjcnxofLTm6Pt2LHXNaI5ANHoD
         HBqXIyU8RbYijB8XlzXLhbyK6CgTRb1/N1Gu7I7vnm8JzD5BnFdSJ8PTbIdfzuTPNayn
         bNAw==
X-Gm-Message-State: ACrzQf0OUDqCT6J7HjVosZ9zmNuJ1PGdQXOpqapE978Mp8r0HkMrPPNK
        nbUwsiTMbrly+7YkTPW32xfQww==
X-Google-Smtp-Source: AMsMyM7bICOZH0WwwuU7fNoFf+LgOTWBrxWtoTyS+ATZwpycmOgrlRhY8fZfiOYOKBnDvxk46dEb3g==
X-Received: by 2002:a17:903:110f:b0:178:8756:6e5e with SMTP id n15-20020a170903110f00b0017887566e5emr938412plh.12.1663335108874;
        Fri, 16 Sep 2022 06:31:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s15-20020a63524f000000b00434acf7a05fsm13723090pgl.45.2022.09.16.06.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 06:31:46 -0700 (PDT)
Date:   Fri, 16 Sep 2022 06:31:45 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: harden i2c_mux_alloc() against integer
 overflows
Message-ID: <202209160630.CF7AE9708D@keescook>
References: <YyMM8iVSHJ4ammsg@kili>
 <YyMt2cWtHC2SeG62@work>
 <YyMyKQnWgu0SL6jj@kadam>
 <202209160101.2A240E9@keescook>
 <YyQyfaI0WCsQ8F48@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyQyfaI0WCsQ8F48@kadam>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 16, 2022 at 11:23:25AM +0300, Dan Carpenter wrote:
> [...]
> net/ipv6/mcast.c:450 ip6_mc_source() saving 'size_add' to type 'int'

Interesting! Are you able to report the consumer? e.g. I think a bunch
of these would be fixed by:


diff --git a/net/core/sock.c b/net/core/sock.c
index 4cb957d934a2..f004c4d411e3 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -2552,10 +2552,11 @@ struct sk_buff *sock_omalloc(struct sock *sk, unsigned long size,
 /*
  * Allocate a memory block from the socket's option memory buffer.
  */
-void *sock_kmalloc(struct sock *sk, int size, gfp_t priority)
+void *sock_kmalloc(struct sock *sk, size_t size, gfp_t priority)
 {
-	if ((unsigned int)size <= sysctl_optmem_max &&
-	    atomic_read(&sk->sk_omem_alloc) + size < sysctl_optmem_max) {
+	if (size > INT_MAX || size > sysctl_optmem_max)
+		return NULL;
+	if (atomic_read(&sk->sk_omem_alloc) < sysctl_optmem_max - size) {
 		void *mem;
 		/* First do the add, to avoid the race if kmalloc
 		 * might sleep.


-- 
Kees Cook
