Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38FF358BE3
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 20:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbhDHSDA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 14:03:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:33838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232202AbhDHSC7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Apr 2021 14:02:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A3BD61130;
        Thu,  8 Apr 2021 18:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617904967;
        bh=e2oaFMX2BkMDf/qaiy9ZH1hE8M7tU7AqcU5mNRXW05c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kh2NSMDRY2CiRftM7jKOFUirTJzcxmpacTVogxdZKXtSVwGWHHTYowvf2SFNzXU/s
         KIP8eDjtGA1LLgTGiRoqQ+G4A9TMN9ivCd6SlehCNHz19PGwPJRn1NWdKo7iU71Ehp
         tMI4IvDd1LyomN50WOTc12utKhuUDle7F0+/aXpssP/nz7jthiW75KmCxTS0/dCc/5
         qfmsAmbvWQSmLkSWHTsBSvsNBzchqmqPqlttrFFzJHXVlUChYkttUIew4G0bGGSMri
         b2uI7yLmnugge075kbbBlysNQUNiAjEGykOUcIhzVwx9NA2fIOLieGJPxYqFAUX+75
         WAecxsY3ApF8g==
Received: by mail-ed1-f47.google.com with SMTP id z1so3493051edb.8;
        Thu, 08 Apr 2021 11:02:47 -0700 (PDT)
X-Gm-Message-State: AOAM533QkkZlNNZDoK+ChoGXDUfFzNPXOe59d8aJtCUfAZjMfpVqpgZj
        jYWOZoyxClCDWVKcsI/omcOGhY+rwov0IklC2A==
X-Google-Smtp-Source: ABdhPJwGqYbC/rreiPsuB+s+xhMWCGvVXevrwFIxBspCgbBc7v93pX3PXpcKJyDX3opJzJuk4FpkGVi2o0oLsz0rQNI=
X-Received: by 2002:a05:6402:1b1c:: with SMTP id by28mr13053524edb.62.1617904966139;
 Thu, 08 Apr 2021 11:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210407183532.2682-1-wsa@kernel.org>
In-Reply-To: <20210407183532.2682-1-wsa@kernel.org>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 8 Apr 2021 13:02:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLJiXg4V7LpiOM9r0Fso8rfGciVQeT_mgt4=GBWfLE4WA@mail.gmail.com>
Message-ID: <CAL_JsqLJiXg4V7LpiOM9r0Fso8rfGciVQeT_mgt4=GBWfLE4WA@mail.gmail.com>
Subject: Re: [PATCH] i2c: imx: mention Oleksij as maintainer of the binding docs
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>, devicetree@vger.kernel.org,
        Oleksij Rempel <o.rempel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 7, 2021 at 1:35 PM Wolfram Sang <wsa@kernel.org> wrote:
>
> When I removed myself as a maintainer of the yaml file, I missed that
> some maintainer is required. Oleksij is already listed in MAINTAINERS
> for this file, so add him here as well.
>
> Fixes: 1ae6b3780848 ("i2c: imx: drop me as maintainer of binding docs")
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
