Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8192D16ED9F
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 19:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729894AbgBYSO0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 13:14:26 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41345 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728367AbgBYSO0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Feb 2020 13:14:26 -0500
Received: by mail-ot1-f66.google.com with SMTP id r27so390626otc.8;
        Tue, 25 Feb 2020 10:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fzMstvFQHtiY1mtNKEHbS1tBWH2f5ubsJc5MbGcMIgE=;
        b=HyNQ+Mnlx2OA+FSb4OCPVzkfovoiW/VFmg6F0lyRHN+TkeLoNil7ruYFCt+LBXkyG4
         PQa3Ow43Ax5WZw6zb07cWOkFS60N1C6EpKpJZ/b2x/ZtOOPD9IvKWy2q047H34TxU4l+
         lI+SrvUXV6HQHcsxRvjM2yZ2zTfJ1xWD+LNtED6hNbpZK3vvPaNT+HWa58uw7Ys2EqF5
         5QLA80P+zcLJCCNn9wG0Hqydnx4xN+RzHeAK1xg6mv1O1MP+CFaZRFZwi9AXsS+V/cdV
         Bp/sRUuJFNTCsY973ybCjNBtJTkiNQYXu9luqbTbeZRYgDzc9LU0WIA2yd12UPxziXVB
         COww==
X-Gm-Message-State: APjAAAWGUnqnCg9XlWTW+6ggonv30CM16BT87Mp8BUFsm/L0BzwuukKa
        1vyIKq4tWBPhTTpXOeUyVw==
X-Google-Smtp-Source: APXvYqyGKyCpS5QVH0RlgQkGwt+azhBTDZOJ39HMNdZPpnFpagNcBAnEczZ6ez53W17xGffq9mb+tQ==
X-Received: by 2002:a05:6830:4c7:: with SMTP id s7mr45097888otd.359.1582654463904;
        Tue, 25 Feb 2020 10:14:23 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o1sm5881508otl.49.2020.02.25.10.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 10:14:23 -0800 (PST)
Received: (nullmailer pid 32082 invoked by uid 1000);
        Tue, 25 Feb 2020 18:14:22 -0000
Date:   Tue, 25 Feb 2020 12:14:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Eric Anholt <eric@anholt.net>, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        Phil Elwell <phil@raspberrypi.com>,
        linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 01/89] dt-bindings: i2c: brcmstb: Convert the BRCMSTB
 binding  to a schema
Message-ID: <20200225181422.GA32044@bogus>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <6649111e9c585f267762bb6c6dd96128e5cfb4ba.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6649111e9c585f267762bb6c6dd96128e5cfb4ba.1582533919.git-series.maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 24 Feb 2020 10:06:03 +0100, Maxime Ripard wrote:
> Switch the DT binding to a YAML schema to enable the DT validation.
> 
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-i2c@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/i2c/brcm,brcmstb-i2c.yaml | 59 +++++++-
>  Documentation/devicetree/bindings/i2c/i2c-brcmstb.txt       | 26 +---
>  MAINTAINERS                                                 |  2 +-
>  3 files changed, 60 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/brcm,brcmstb-i2c.yaml
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-brcmstb.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
