Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C84C3D0E6
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 17:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404993AbfFKPef (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 11:34:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:59752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404969AbfFKPef (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 11 Jun 2019 11:34:35 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0685B21721;
        Tue, 11 Jun 2019 15:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560267275;
        bh=EIcAIZ/5jQEzsABeTR+aC7PKVrq9xNtOvhCECCAOhjo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2Ogg9gJ/CYlSDlMcbqVkJHH5oo+Tf0jE47tYWydzdt4mFoTMuYTcuhWE869ebEtb7
         J1nPQsMEtCCZ27ZQzz0zRxESbZkpv3MdpqfNUNIkRZF9j5M1cjUN7B1Ph6DCLGp7Pq
         zQNc77IZ4hIAeBoH/G76FhHmgM7u7nC3qJVpyMBk=
Received: by mail-qt1-f173.google.com with SMTP id 33so6881216qtr.8;
        Tue, 11 Jun 2019 08:34:34 -0700 (PDT)
X-Gm-Message-State: APjAAAUcerDhaq86vP1K3FAlEw4tRuBF4ug2HDQM50DtLQdoO07rnAL0
        IlzpUBdJdomke1nItpjzQZ/Vms6Dlk19KoznlQ==
X-Google-Smtp-Source: APXvYqxHE0iAyuzqP4GlfYljLhcmiHNIV4RBb1i3p8OE6draWdzReILUB1955qUO5N63UUi+1XWDV8PkRg1hqqwYAPs=
X-Received: by 2002:aed:3fb0:: with SMTP id s45mr11888081qth.136.1560267274275;
 Tue, 11 Jun 2019 08:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190611090309.7930-1-maxime.ripard@bootlin.com>
In-Reply-To: <20190611090309.7930-1-maxime.ripard@bootlin.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 11 Jun 2019 09:34:22 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK7F+6W_GGAtkjv-tiou9s1tMDcB+2yshrDqoTU1V65KQ@mail.gmail.com>
Message-ID: <CAL_JsqK7F+6W_GGAtkjv-tiou9s1tMDcB+2yshrDqoTU1V65KQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: sun6i-p2wi: Add YAML schemas
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 11, 2019 at 3:03 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Switch the DT binding to a YAML schema to enable the DT validation.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v2
>   - Remove redundant constraints on address-cells and size-cells
>   - Fix the example
> ---
>  .../i2c/allwinner,sun6i-a31-p2wi.yaml         | 65 +++++++++++++++++++
>  .../bindings/i2c/i2c-sun6i-p2wi.txt           | 41 ------------
>  2 files changed, 65 insertions(+), 41 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-sun6i-p2wi.txt

Reviewed-by: Rob Herring <robh@kernel.org>
