Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6ABA1CE81F
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 00:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgEKWdV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 18:33:21 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37243 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgEKWdU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 May 2020 18:33:20 -0400
Received: by mail-oi1-f194.google.com with SMTP id r25so16579699oij.4;
        Mon, 11 May 2020 15:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wGHbSnsFJYGWuvu1b3WM72Xji0DD4irBuSVt4YkTgKI=;
        b=Y8CdWJCRDvl25E1mJwhC8qLL6tZUbeKuOzet9j+geT4olvafExX2aimyMfDQtwc4U4
         s2g8JGQV2duXyF18kGm6uNrpM1WWazUwBd33fuQjbh4lz5uONFWDDjFOSNZ51HPcm0uY
         aVI9vpby+zTHflVDZgVTsH2bDZNxwx2716WIZ15mvQqUIojYC4WJmoxvMCPhkrmVPGkG
         gg40kEkHLyZU7/CGOODrdWTZ5G83YuVxftxyEmCLJkdMr1241sTO5HAM8RfFobbac0uF
         EmdLEvJq/jeKh0aC5g7TR35ETkrSdF9k2k+yRdnQmhMD4QUnX0d6nlJlDb9IgaciPn6F
         Be8A==
X-Gm-Message-State: AGi0PubR/F2whcodtCdHSho8EcDJAsjSOaUGz5v3Ld8HExWiGNvWtaW5
        +97tcyol9gbZqGXzh7IlLcP3H18=
X-Google-Smtp-Source: APiQypJuI3Zhx/CxBn4qh7KjVcz6okjsSvY5mWX+NLlxANjIA4CVRmtDvBU4eGunbZig8CyjwWfN0Q==
X-Received: by 2002:a05:6808:698:: with SMTP id k24mr588483oig.102.1589236397728;
        Mon, 11 May 2020 15:33:17 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s16sm3989264oij.5.2020.05.11.15.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 15:33:16 -0700 (PDT)
Received: (nullmailer pid 5158 invoked by uid 1000);
        Mon, 11 May 2020 22:33:16 -0000
Date:   Mon, 11 May 2020 17:33:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        od@zcrc.me, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: clock: Convert ingenic,cgu.txt to YAML
Message-ID: <20200511223316.GA5051@bogus>
References: <20200426185856.38826-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426185856.38826-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 26 Apr 2020 20:58:49 +0200, Paul Cercueil wrote:
> Convert the ingenic,cgu.txt doc file to ingenic,cgu.yaml.
> 
> The binding documentation has been updated as well. The node can have a
> child node that corresponds to the USB PHY, which happens to be present
> in the middle of the CGU registers.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../devicetree/bindings/clock/ingenic,cgu.txt |  57 --------
>  .../bindings/clock/ingenic,cgu.yaml           | 122 ++++++++++++++++++
>  2 files changed, 122 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/ingenic,cgu.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
> 

Applied, thanks!
