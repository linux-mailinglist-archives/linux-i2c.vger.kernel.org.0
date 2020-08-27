Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDA89254C39
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Aug 2020 19:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgH0Rep (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Aug 2020 13:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbgH0Rep (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Aug 2020 13:34:45 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 023AEC061264;
        Thu, 27 Aug 2020 10:34:45 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id h20so2983637ybj.8;
        Thu, 27 Aug 2020 10:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GxmsvrLcpOeXkCsHlYXOAwY7VKh0UFsLAGO+5hEpk1Q=;
        b=lkTRJ1mKgk4cIPuJ5IMvWG7ijG3umHYB9nYkL+oAJE0t4OsJ46F+wrtWGJyoATCPDe
         VgjH7PdTEqWZlvirOE9s9TVibxiJkkuQ6kXyEKqIMRpTeuPee5ss5QhmULBlaR1vuwey
         XxS5NHbuxWiLkMAHuN/JURh/tsxhhFe/K8KNqu+Qzax9sHpZQmbIDX8O/jFU+Y0Od+1e
         W+h5Z0Xk41k+qJEnvjnCG47zj4+oe+aLNkKv+y40anEwRnpVhdFU2OhpFC/f1n1D5KSs
         VIeIMfApZ/AOVKQ3UA5neQ3owEIe4rKaJR8UoqRGR+0wBAaEOIUDt3IUif5ANx5IkZy9
         YGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GxmsvrLcpOeXkCsHlYXOAwY7VKh0UFsLAGO+5hEpk1Q=;
        b=uUKFCl0BiS4ma1xTAEAj9eYp/xmmqQ0xiw1P7eNYM61ZEDZ0XZmdJYP6TzbafE1GVp
         pvbHf98Qm5LWbQtS+Ken/SBDAYU/q+LJfrGd71OCXMb0cP+KqqeJFrEETTm9RjGlkgew
         DxK3khucCbSZrNXp4dr9gSLo5Hti5nb0zFPHKlBCUxlh2yMe5OM6gpUSBNOwgiU/61bi
         +Z3PRUhFJVD+Xs8qDTk+Qb8ppbqAXFFECT2K8rLZbWaGoA8/Vtk8Eqb8ucydwFJCKgHP
         ASkWelP22O4l4G2tmvG2TA89xpLHIQanSxlh/IcrTdmRcnIPDixWgsxiRtz0zbYH0nuj
         IW3g==
X-Gm-Message-State: AOAM5308HyJkvGyMJV2nLveWfBQ89AAikRHtbl82K4C9hg8O7a+7T4U5
        RN42zJP8kUezcf0/8mEB5EDztUXT3enIFgJA2Wk=
X-Google-Smtp-Source: ABdhPJxYWuCSYXqkPcWE01ctXjzSlgjHoDui1b/Nonl6BZbG1ITby8r+A827hGsYXxn7sV4XEbLGCqrkeleiozi355w=
X-Received: by 2002:a25:2f4d:: with SMTP id v74mr28532113ybv.401.1598549684365;
 Thu, 27 Aug 2020 10:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594919915-5225-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 27 Aug 2020 18:34:18 +0100
Message-ID: <CA+V-a8sn1_fKbHt6cy-27+j2HWFp7Fjt8XBRZPLpvN47C3E3hQ@mail.gmail.com>
Subject: Re: [PATCH 01/20] dt-bindings: pci: rcar-pci: Add device tree support
 for r8a774e1
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-ide@vger.kernel.org,
        dmaengine <dmaengine@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        alsa-devel <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bjorn,

On Thu, Jul 16, 2020 at 6:18 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Add PCIe support for the RZ/G2H (a.k.a. R8A774E1).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/pci/rcar-pci.txt | 1 +
>  1 file changed, 1 insertion(+)
>
Gentle ping.

Cheers,
Prabhakar
