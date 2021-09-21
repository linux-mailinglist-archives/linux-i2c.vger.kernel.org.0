Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC064131F1
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Sep 2021 12:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbhIUKvd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Sep 2021 06:51:33 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:31784 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbhIUKvb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Sep 2021 06:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632221216;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Sx06uvrl+e0LyA/YFWFUPKtUiEYmws41XgsZoMZbkc8=;
    b=NFpzdTEh6U6tDWgj+/r+AcrE0mTMQCxfJwGEuv/NSk51r/Px02YwooSpud4Lxa3d41
    pf78fNDqe+rsSsq8nqOK6Elzju77PS2DH5oo1QVjQw4hb0pnib6D/Om+BgwKtM7mRubV
    Lua6T6iKpL/bAMYErdNn3xjTcKw9X/KyMU5Jxl3ux/sUMBf7HXsLzVE2DgwDL0vONTGd
    QPf1QS+Smz4IMtWD0EhcZxo42WatIDMSYjrmLXdKEV/TnoR8QXUJAoWB65PpTuqGDTcU
    y1pcy1TF10WETNPtstiq23XxBLlzT7Tj+4d3lPzkrmJbGZvdoWZPN/hb9VbMueJTdNbN
    I/9g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fGl/w2B+Io="
X-RZG-CLASS-ID: mo00
Received: from oxapp02-03.back.ox.d0m.de
    by smtp-ox.front (RZmta 47.33.8 AUTH)
    with ESMTPSA id c00f85x8LAku4Et
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Tue, 21 Sep 2021 12:46:56 +0200 (CEST)
Date:   Tue, 21 Sep 2021 12:46:56 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Ryo Kataoka <ryo.kataoka.wt@renesas.com>
Message-ID: <936300701.1399345.1632221216524@webmail.strato.com>
In-Reply-To: <20210915134827.13043-1-wsa+renesas@sang-engineering.com>
References: <20210915134827.13043-1-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] i2c: rcar: enable interrupts before starting transfer
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.5-Rev23
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> On 09/15/2021 3:48 PM Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> 
>  
> We want to enable the interrupts _before_ starting the transfer because
> it is good programming style and also the proposed order in the R-Car
> manual. There is no difference in practice because it doesn't matter in
> which order both conditions appear if we wait for both to happen.
> 
> Signed-off-by: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-rcar.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index bff9913c37b8..fc13511f4562 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -339,6 +339,9 @@ static void rcar_i2c_prepare_msg(struct rcar_i2c_priv *priv)
>  		priv->flags |= ID_LAST_MSG;
>  
>  	rcar_i2c_write(priv, ICMAR, i2c_8bit_addr_from_msg(priv->msg));
> +	if (!priv->atomic_xfer)
> +		rcar_i2c_write(priv, ICMIER, read ? RCAR_IRQ_RECV : RCAR_IRQ_SEND);
> +
>  	/*
>  	 * We don't have a test case but the HW engineers say that the write order
>  	 * of ICMSR and ICMCR depends on whether we issue START or REP_START. Since
> @@ -354,9 +357,6 @@ static void rcar_i2c_prepare_msg(struct rcar_i2c_priv *priv)
>  			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_START);
>  		rcar_i2c_write(priv, ICMSR, 0);
>  	}
> -
> -	if (!priv->atomic_xfer)
> -		rcar_i2c_write(priv, ICMIER, read ? RCAR_IRQ_RECV : RCAR_IRQ_SEND);
>  }
>  
>  static void rcar_i2c_next_msg(struct rcar_i2c_priv *priv)
> -- 
> 2.30.2

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
