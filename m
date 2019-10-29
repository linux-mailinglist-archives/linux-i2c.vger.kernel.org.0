Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A08AE8C97
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2019 17:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390053AbfJ2Q03 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Oct 2019 12:26:29 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46731 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728902AbfJ2Q03 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Oct 2019 12:26:29 -0400
Received: by mail-ot1-f68.google.com with SMTP id 89so10235591oth.13;
        Tue, 29 Oct 2019 09:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jrYKN+h6Z3GleTEUBK92hvb5i3b1naeQCWbIcyAY6B0=;
        b=B+cqKUbabmrIEJxT7OujOfHIV6mxSjq7lXS7DZh147y5Bh/2Is1MKvNFpP6WyuJAxa
         P1XEfWEiATSqb+VFy7GAnambOwEVbcdj9uLEzwv3fS/W2CEFk1Goba9n+m2OMF8rOwmE
         8sQbUO0U3kXYciHJEiXw1pwbE3OeE9cmgFuH3Y02nDUzv2VJsORqY5y2a+yPNL+KxUtN
         UV/IxPKoBGWXNicUiehC+zrT3JcuAgLK6nwQfr+n7iO9r0l0nK4an/GWAN0/65JtygsD
         vJjmhqrlxfdzuns1WClalFeIdZNEUD8G4yUKuQFAg/32ORF5AlIcjHv4bW/sYmaBZdf1
         8RSg==
X-Gm-Message-State: APjAAAV//hPaEOSg5CfoRm13yEYsKVtrmKkQDPPUOODiTbIN1nDRlD/F
        kgCl0I0Q4803QzUmEWXSkQ==
X-Google-Smtp-Source: APXvYqwQTFB5Bg3vscJfKb3aCnMfFE1g7KjqQZhR4gt+OVU1yKKpL1jg/S6GMNBR5n2q/cPa3xoaMw==
X-Received: by 2002:a9d:721c:: with SMTP id u28mr18904247otj.359.1572366387883;
        Tue, 29 Oct 2019 09:26:27 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d27sm2347954ote.11.2019.10.29.09.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 09:26:25 -0700 (PDT)
Date:   Tue, 29 Oct 2019 11:26:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Beniamino Galvani <b.galvani@gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: meson: convert to yaml
Message-ID: <20191029162624.GA1057@bogus>
References: <20191021140053.9525-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021140053.9525-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 21 Oct 2019 16:00:53 +0200, Neil Armstrong wrote:
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic I2C Controller over to YAML schemas.
> 
> Cc: Beniamino Galvani <b.galvani@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/i2c/amlogic,meson6-i2c.yaml      | 53 +++++++++++++++++++
>  .../devicetree/bindings/i2c/i2c-meson.txt     | 30 -----------
>  2 files changed, 53 insertions(+), 30 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-meson.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
