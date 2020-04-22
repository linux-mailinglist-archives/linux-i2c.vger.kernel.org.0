Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7754B1B4E37
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Apr 2020 22:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgDVUOY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Apr 2020 16:14:24 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41916 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbgDVUOX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Apr 2020 16:14:23 -0400
Received: by mail-oi1-f196.google.com with SMTP id 19so3036973oiy.8;
        Wed, 22 Apr 2020 13:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GDTGxHp+7xM8DCTMf06kFTU5nsfpXRU+QRtWSipR1zk=;
        b=lL7+XDmAU8lddHecExKAe+pAcwBiL85dlUTG+LCWV7xIJIdmesjDmDCNWtcfaiWHqY
         D7mFho4QvSuE34PM2ZVT82zXc2Da4Pig1c/DANKD530LwLM0+JfjIoZsPU0k0h0DwwDL
         q3OpKuVOe5DRT70jA9RsTJACU4g2yvlN/g5O5/Eju+LCvUxnedS+MxeAUX91+TusRVqO
         aVKh8+Upv8dsGuseugPiOR9htNR1d3tj5WJialTs+Eacwvbyo2kqWMC1O1IavbRc4Kcy
         ZZfvw0u5UJMFX0y2Yw8nuk1651/P0WN9vcjI8akCBJM9Pl8cb9eqge98Y5oF45WpiEdr
         2LkQ==
X-Gm-Message-State: AGi0PuZOuG6PIvXGBkgjtIkRlJoMWvI6zokDwVm2i6RTP2Q8cexmWEkL
        oLMc1UgX5zz5ILibBiIQNQ==
X-Google-Smtp-Source: APiQypLVf7Tc3FR4NF4rnCHth/7N/IyIs0LVZfRjM6m95Nh9kSxdM322X/m/3nu32NGV3DRUZ7McSw==
X-Received: by 2002:aca:3a8a:: with SMTP id h132mr541386oia.146.1587586462879;
        Wed, 22 Apr 2020 13:14:22 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q15sm32082otk.78.2020.04.22.13.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 13:14:22 -0700 (PDT)
Received: (nullmailer pid 22312 invoked by uid 1000);
        Wed, 22 Apr 2020 20:14:21 -0000
Date:   Wed, 22 Apr 2020 15:14:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, tfiga@chromium.org,
        drinkcat@chromium.org, srv_heupstream@mediatek.com,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v13 1/2] dt-binding: i2c: add bus-supply property
Message-ID: <20200422201421.GA21271@bogus>
References: <20200421051858.11176-1-bibby.hsieh@mediatek.com>
 <20200421051858.11176-2-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421051858.11176-2-bibby.hsieh@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 21, 2020 at 01:18:57PM +0800, Bibby Hsieh wrote:
> In some platforms, they disable the power-supply of SCL/SDA due
> to power consumption reduction. This patch add bus-supply property.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
