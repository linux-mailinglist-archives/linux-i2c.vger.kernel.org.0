Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9D0C8B11
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2019 16:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728354AbfJBOTr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Oct 2019 10:19:47 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:45331 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728123AbfJBOT2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Oct 2019 10:19:28 -0400
Received: by mail-qt1-f196.google.com with SMTP id c21so26491621qtj.12;
        Wed, 02 Oct 2019 07:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:cc:to;
        bh=q5/Vrt7YbSMYYe+TqRWfnWGfFj48YtOuzlgQybM3rrI=;
        b=EqVImqspe4KABjB4uM5Lc35aaCX1sI3fKKKVNBCTRpIjd4al64KV3dw/9jGc5ydPDT
         cIV8XtnxCuWgjGBUSY/2T+cW9TK4RW03hRVGUMRvw8BSP6jrhf/bddb7X6nrmDE2imIO
         y+HVflUfjEOfgn9IUm7/jRvo+2CxXy9tsUM4G9U/I6A4DCIb2HKYgfSGAfS3xUAIEMi1
         w/g5tcAoxyIEyDFZgp7rCqRLMu6WxDFqHthJljYQUC2iid6Bxdty3sRslFrYKLYZinux
         yMwiJLYW+UwdRotWFsgr4ko1/t3Zw5pGE9ZM3ONyRSV1XjvxSpfNsyHHh/Lr4SV74rUz
         ykZQ==
X-Gm-Message-State: APjAAAV3zLTkcIVW1N9fpe0px90a8ZCEACz1PbTR1D6lRR+0+PhedpvL
        PAy+qAdhCsAJAtVUNJRrmg==
X-Google-Smtp-Source: APXvYqzI8tlDknPTtCYkYMf8YiII8BB2Pn9q3BZ6ZLRPxE5d81/Tdh2KvJ7CO7oGH4jp9psZIS97qw==
X-Received: by 2002:a0c:b596:: with SMTP id g22mr3230956qve.231.1570025967555;
        Wed, 02 Oct 2019 07:19:27 -0700 (PDT)
Received: from localhost ([132.205.230.8])
        by smtp.gmail.com with ESMTPSA id l185sm9749623qkd.20.2019.10.02.07.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 07:19:27 -0700 (PDT)
Message-ID: <5d94b1ef.1c69fb81.61d87.2984@mx.google.com>
Date:   Wed, 02 Oct 2019 09:19:24 -0500
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: i2c: sh_mobile: Add r8a774b1 support
References: <1569310619-31071-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569310619-31071-1-git-send-email-biju.das@bp.renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
To:     Biju Das <biju.das@bp.renesas.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 24 Sep 2019 08:36:59 +0100, Biju Das wrote:
> Document RZ/G2N (R8A774B1) SoC bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

