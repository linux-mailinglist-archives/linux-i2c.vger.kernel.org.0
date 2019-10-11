Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF040D43D3
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2019 17:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfJKPJk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Oct 2019 11:09:40 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36308 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbfJKPJk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Oct 2019 11:09:40 -0400
Received: by mail-oi1-f194.google.com with SMTP id k20so8278188oih.3;
        Fri, 11 Oct 2019 08:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2jMHwOitJSgKBIWAGaWAYObwjrzeoaV9e3k/7PTkxAo=;
        b=NqWUWcnsC2CiDRPX1jpB3mzt34z5i1PcZUEy3XrMRvX3joEynaxzSeBsAibfYQwx5l
         +4/ve9FxjXclRKCeYnqYI0jGsPqrpYTZAnU5bFb/3/3dNhGqLCT8cRZjW6THr/ZNsLe7
         Jk0at4ydmF1AQzemBK3DZIn1/U2Zscr441CqTYuqVcN2131UDvrS9LU9S9iGlqsKKPOT
         X5TaS0fCGCOoHA74b4RFpCSY7IQAIsfoZwvkapU6CxZO4QpHlvKFazFh5xGYgmXxf9nr
         2ECu/Yd8ntCPVPDkZovaSRZMLhZaM9lDulJhNjmwu43Xpys61Hf5awUpgt0rnt78B76P
         OyNg==
X-Gm-Message-State: APjAAAU4nAdwn/Uv7nUMwa1niQD0B07QKVRdEUmX96gfKp8UE5WzC+JU
        BuERP2LDPBPsBSJit5gYoQ==
X-Google-Smtp-Source: APXvYqyQphDcWaDmhFGH6AE2aMBJbIU0akQPLklrY1sN/qLpnHos7OJ9vKkSYJ/YrhkXyboxiGZo0A==
X-Received: by 2002:aca:aac1:: with SMTP id t184mr12087565oie.165.1570806579346;
        Fri, 11 Oct 2019 08:09:39 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y16sm2649391otg.7.2019.10.11.08.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 08:09:38 -0700 (PDT)
Date:   Fri, 11 Oct 2019 10:09:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: i2c: rcar: Add r8a774b1 support
Message-ID: <20191011150937.GA11786@bogus>
References: <1570175998-50891-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570175998-50891-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri,  4 Oct 2019 08:59:58 +0100, Biju Das wrote:
> Document RZ/G2N (R8A774B1) I2C compatibility with the relevant driver
> dt-bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> V1-->V2
>  * Rebased on top of next.
> ---
>  Documentation/devicetree/bindings/i2c/renesas,i2c.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
