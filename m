Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE48908DE
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2019 21:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727678AbfHPTpH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Aug 2019 15:45:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:52432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727569AbfHPTpG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Aug 2019 15:45:06 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B50121744;
        Fri, 16 Aug 2019 19:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565984706;
        bh=KzTWxmEu6v0xr9Hn+OmqkbU9wqNoAf9onn0WZItZQ8w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=C1f4/0Difu8NwVOGgwQLA44FJxkNPd5cak2I9kBTVIVNOYgl1LXsmyZpgcZ+2P/Pe
         HBTzPRYUrAlcUjeJjmn3xyGoTXI3jWp/CcuTapJbzmzP84dudLYcsBFG8L447gONyr
         c5o6VWzFE1/5dUVs/CbkXO/S7VWtaGkSwF2fg9OU=
Received: by mail-qk1-f180.google.com with SMTP id p13so5631913qkg.13;
        Fri, 16 Aug 2019 12:45:06 -0700 (PDT)
X-Gm-Message-State: APjAAAViXggKZpng3xy9wQQV2k8iFbwjl+Ep6RW+E1RrxMtb0vYpGNur
        bqrGW/3TbsyjkNXbpheQFuY3BsTYEqJBI4KHww==
X-Google-Smtp-Source: APXvYqzU/sQLWZmEUyGPNZBgopXitRzgXPRHAgAi2jpIl9kVzaTAUknmMEbeU/L35JSuQaNruf8lttCiD7ojvcKtId0=
X-Received: by 2002:a37:a010:: with SMTP id j16mr10658432qke.152.1565984705423;
 Fri, 16 Aug 2019 12:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190816064710.18280-1-bshah@kde.org> <20190816084309.27440-1-bshah@kde.org>
 <20190816084309.27440-2-bshah@kde.org>
In-Reply-To: <20190816084309.27440-2-bshah@kde.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 16 Aug 2019 13:44:53 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK_j_AK5wa3cOw_SpVZAX+m_iSvnR+Sgh0dbqxYxHKr=Q@mail.gmail.com>
Message-ID: <CAL_JsqK_j_AK5wa3cOw_SpVZAX+m_iSvnR+Sgh0dbqxYxHKr=Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: mv64xxx: Add compatible for the
 H6 i2c node.
To:     Bhushan Shah <bshah@kde.org>
Cc:     Icenowy Zheng <icenowy@aosc.io>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 16, 2019 at 2:44 AM Bhushan Shah <bshah@kde.org> wrote:
>
> Allwinner H6 have a mv64xxx i2c interface available to be used.
>
> Signed-off-by: Bhushan Shah <bshah@kde.org>
> ---
>
>  Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
