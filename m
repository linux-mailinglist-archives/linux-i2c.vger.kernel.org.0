Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A30E972CDBB
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 20:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236088AbjFLSTm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jun 2023 14:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235401AbjFLSTl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 14:19:41 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00D6B196
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jun 2023 11:19:39 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b1a66e71f9so55957541fa.2
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jun 2023 11:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686593978; x=1689185978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIcg7pJd0cwbfg9c0aZTwZpn8AdMMmzA5pA+DOnVHoc=;
        b=lq8SNWAj4ps1z4QGh7oCXlUkXWT0ZkbDr2f+ofeufBm5B4qosCS0xSr/3XYbjCwcEW
         44VcUFD1k5egHTfDL/WNPOm3FlVgX8YF+j6t/k63Q0NcsIjlAHMB96g+ismPDQLhHmhM
         z1SJWKHOLR4sacHmFcYEvIXj2omo3DKoqO3Rh+vp1ssfUcJmSWuhvHY3MeOwNqyjbOVS
         8v62n3xKMKJyR7jeXdSp/csjkrojezkea48eRnqVcdMw/GZi2bTgrMeJu54rbaNS2LRi
         UxwXGapaSqwq9X1RlT9aGA41dVuSUR7JjzPPSi2OFVWzqf/Dl0k6mjW2F3djzvDleVNd
         Q+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686593978; x=1689185978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sIcg7pJd0cwbfg9c0aZTwZpn8AdMMmzA5pA+DOnVHoc=;
        b=Qd2rw62nf2hTm2t0+77haSR7+fZighv12nQgfUKNUbwHK6LNBCs98Skmw6C3ZA+ooZ
         aOWnLex2xtk16c6oKnrde+Wf7zAwzjd+fPyYR0UMR/3LZKMUUkT7kvADrCl2uc+qbJ9o
         +3ruBElrHNg3g17ltUM5ZddyyEAnTEsWv6pfD9u/trgMjeeO7nMkb/3vHxnhEU+K8Hd9
         uBhIz6apHK7NxOv24k+qyldn1C4Y2Vf27NfTxK026e3oMa4v08rfgaXkeCpybuKQJuSX
         CNOY/A8WICYKpoomqGRJOUmIxGDJ+54GJBD3YGoRglB2CsTCgzxEl0C5291RYG/4cPd4
         gy3Q==
X-Gm-Message-State: AC+VfDxiQzFCNM+ZMJ57nM/1gDtVAODovie6RK3gHB3e886mfVk/N5SA
        EOk3hMCmQOuZ0Ef9GsRfrnbLz0CQBS0kFA==
X-Google-Smtp-Source: ACHHUZ7ms7zFXaDHjEi/S+TtdX76PdJYvhfzRQ8QJ3I9vcAJiBJKn0xGwMreNfPwdadl9Ytjdf7P5g==
X-Received: by 2002:a2e:9456:0:b0:2b1:bfcc:119d with SMTP id o22-20020a2e9456000000b002b1bfcc119dmr3318514ljh.5.1686593978023;
        Mon, 12 Jun 2023 11:19:38 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id d22-20020a50fb16000000b005149c7b1f49sm5267576edq.64.2023.06.12.11.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:19:37 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Linux I2C <linux-i2c@vger.kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 13/15] i2c: busses: sun6i-p2wi: Use devm_clk_get_enabled()
Date:   Mon, 12 Jun 2023 20:19:35 +0200
Message-ID: <1853170.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20230611225702.891856-14-andi.shyti@kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-14-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dne ponedeljek, 12. junij 2023 ob 00:57:00 CEST je Andi Shyti napisal(a):
> Replace the pair of functions, devm_clk_get() and
> clk_prepare_enable(), with a single function
> devm_clk_get_enabled().
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


