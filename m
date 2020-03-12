Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 314D6183578
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Mar 2020 16:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgCLPwS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Mar 2020 11:52:18 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33330 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgCLPwS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Mar 2020 11:52:18 -0400
Received: by mail-ot1-f66.google.com with SMTP id g15so6780008otr.0;
        Thu, 12 Mar 2020 08:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Wl+QdR69Vmfg4Y3G8/WF9bc0auAAgV6RS3RNdeDTWcg=;
        b=fJN+EvJioVwsoIMZ/MB3eJ5KMd9XKZIee273+kc/p3KTcmBG5Bu1VfTimB1oyXD0Ya
         4aP+nxZ8aDx5Yvh41f7XmOZn1BFEd7codZ+pFXScnzUATtKBbvk/cRL1Zekyu2TTVSlM
         fA0KuEGTkOYXK48m4nw84+WmidrarvT3exCFBIXEo14/sCFw0OTFkytjcVirOdvUimGQ
         3kfqA0jowA5CzPx6zFCZaCGJf35ZSNDww0vTHtCxZDkOhpgI87opXCE5+FYrnEbi6ck+
         7pDU12oTk94B0JBdIEvw/CAKyy/QCawC6+yED6G25axtbUL4cFkM+TIshY0h2x3A5RpX
         FGAQ==
X-Gm-Message-State: ANhLgQ0tK83fqwxDbpRoLrBpwjARSlKRU58yaDTejLu0cqLADH6jmC8G
        7jKf9PdCwRD46OsSkHxrKcujWU8=
X-Google-Smtp-Source: ADFU+vusdGHjK+Rla6N8fdXTit4DXa60u0wiRrENKI95Qqe2qfm2CTfE3YLR4Ovt+vr8qimPICdxsw==
X-Received: by 2002:a05:6830:11:: with SMTP id c17mr6307470otp.292.1584028336121;
        Thu, 12 Mar 2020 08:52:16 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h92sm7104952otb.2.2020.03.12.08.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 08:52:15 -0700 (PDT)
Received: (nullmailer pid 27751 invoked by uid 1000);
        Thu, 12 Mar 2020 15:52:14 -0000
Date:   Thu, 12 Mar 2020 10:52:14 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     heiko@sntech.de, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/5] dt-bindings: i2c: i2c-rk3x: add description for
 rk3308
Message-ID: <20200312155214.GA27689@bogus>
References: <20200305143611.10733-1-jbx6244@gmail.com>
 <20200305143611.10733-4-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305143611.10733-4-jbx6244@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu,  5 Mar 2020 15:36:10 +0100, Johan Jonker wrote:
> The description below is already in use for rk3308.dtsi,
> but was somehow never added to a document, so add
> "rockchip,rk3308-i2c", "rockchip,rk3399-i2c"
> for i2c nodes on a rk3308 platform to i2c-rk3x.yaml.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
