Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 354853D0E0
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 17:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404991AbfFKPd4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 11:33:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:59342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404969AbfFKPd4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 11 Jun 2019 11:33:56 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9054721773;
        Tue, 11 Jun 2019 15:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560267235;
        bh=/D29hR8xaH+fI3Kqe7nKroDdw+Tyiq+obsj9qSH1T1Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=myT6eu70PDvKi56Pg6USbutKzLV9f4VqqOPSS4yJz2aO1yRgz2F0N0G9gERDVSkqP
         sqdmU6AWKfHaqqH2rxxiqjQOdAX/Z5a0A8ar7LQBV8DJSH75AmsxGicIDHwoBf9ypf
         MxctkGU6B7VPByjcpnw4wd5rnXUP4xDeWMKAkxXY=
Received: by mail-qt1-f181.google.com with SMTP id h21so15008559qtn.13;
        Tue, 11 Jun 2019 08:33:55 -0700 (PDT)
X-Gm-Message-State: APjAAAXo10z98IV3pKcSTnNfbbHR2H9WgslyBfZfiksgdq5KJCaZKqX9
        QHgbuN+z7YwQDY7ZEbAy6tfBNFrdUk1s6cxlhw==
X-Google-Smtp-Source: APXvYqyPTmUTsnof7sPqxoX0Xap7odWWFNRm5z+QuRuINCRzXktgjnJpHwXSC5zbgDayMd0UUX7EQmT9RghDRo6Zt6s=
X-Received: by 2002:a05:6214:248:: with SMTP id k8mr29780000qvt.200.1560267234626;
 Tue, 11 Jun 2019 08:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190611090309.7930-1-maxime.ripard@bootlin.com> <20190611090309.7930-2-maxime.ripard@bootlin.com>
In-Reply-To: <20190611090309.7930-2-maxime.ripard@bootlin.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 11 Jun 2019 09:33:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLXFaDsfrzBc6dUwsuBrhWs=w2m-pXjFBdQ_sm685kf2Q@mail.gmail.com>
Message-ID: <CAL_JsqLXFaDsfrzBc6dUwsuBrhWs=w2m-pXjFBdQ_sm685kf2Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: i2c: mv64xxx: Add YAML schemas
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
> Changes from v2:
>   - Remove the copy/pasted example and use the one we had before
>
> Changes from v1:
>   - Fix the maintainers
> ---
>  .../devicetree/bindings/i2c/i2c-mv64xxx.txt   |  64 ---------
>  .../bindings/i2c/marvell,mv64xxx-i2c.yaml     | 124 ++++++++++++++++++
>  2 files changed, 124 insertions(+), 64 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mv64xxx.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
