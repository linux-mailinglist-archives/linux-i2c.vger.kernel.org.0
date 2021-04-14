Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2126435FDB1
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 00:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbhDNWTu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 18:19:50 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:44772 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbhDNWTu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 18:19:50 -0400
Received: by mail-oi1-f169.google.com with SMTP id e66so6935522oif.11;
        Wed, 14 Apr 2021 15:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=shhxLQuTrS6CU0G16xzkxHsbk3trBrwF7tum2COVf1Q=;
        b=ECOjp2jCDFesyp9HbcmutF6IqPnktJvmu8XagCT1tUf0+RFlRGUcjTzG8xo3RIdy/X
         GvqZpCeRK3ejOKFSA8iraEUkp7BggRyg1Fs+6JCOyxEouNDBQ5iVxwuidxne/IPLYCVY
         tPSso4g5G8ScE9t3d0BsbTaJ2O6QKnp5UuJyGeiB522KwloX8oY7Yl3X7IXeX9G4MVZq
         Ty7uH3qJuguiKM3hnqw6fOwoDYYa3WiW5s/9iauKBsbSNsSC+s+Ui1KOimVU/KARfFpH
         oGhV4mPkG0P41Xv+/qHUkna9iqbB+1VmytjtX4OB7Cko71N5qU7p3ohYf9BsbM1YMp04
         9z8g==
X-Gm-Message-State: AOAM532kDPkxYIYk9bui7bc9ljpcuLb2rt310K59qdTmwReVa6HLfT8M
        ZnPaf80wtYQ4b2qMQ67Byg==
X-Google-Smtp-Source: ABdhPJx6GppsvAcMfhCc/TcWFOcFYEwW+XxDXo6r8z6IJFxygHtL17xNAfoh1RHqI7F2eLpl2oyvAw==
X-Received: by 2002:aca:b787:: with SMTP id h129mr372861oif.58.1618438768152;
        Wed, 14 Apr 2021 15:19:28 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i4sm195366oik.21.2021.04.14.15.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 15:19:27 -0700 (PDT)
Received: (nullmailer pid 69085 invoked by uid 1000);
        Wed, 14 Apr 2021 22:19:26 -0000
Date:   Wed, 14 Apr 2021 17:19:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        intel-gfx@lists.freedesktop.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Qii Wang <qii.wang@mediatek.com>, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v19 2/6] dt-binding: i2c: mt65xx: add
 vbus-supply property
Message-ID: <20210414221926.GA69036@robh.at.kernel.org>
References: <20210414172916.2689361-1-hsinyi@chromium.org>
 <20210414172916.2689361-3-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414172916.2689361-3-hsinyi@chromium.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 15 Apr 2021 01:29:12 +0800, Hsin-Yi Wang wrote:
> Add vbus-supply property for mt65xx. The regulator can be passed into
> core and turned off during suspend/sleep to reduce power consumption.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
