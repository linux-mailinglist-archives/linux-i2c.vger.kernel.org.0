Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90169854E7
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2019 23:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730045AbfHGVG7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Aug 2019 17:06:59 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44436 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729960AbfHGVG7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Aug 2019 17:06:59 -0400
Received: by mail-lj1-f193.google.com with SMTP id k18so86773661ljc.11
        for <linux-i2c@vger.kernel.org>; Wed, 07 Aug 2019 14:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=00H2UQskZ5BXFtSo5pT85vCwfFrt+jrlaI23InYpzlM=;
        b=vNXFpf1n4OxPoEZ0ox3zVbJn2XEk67/2EYD2lYtvTIUZQx6HVoBbA23Tq24peR/eq/
         BU9EkusK9fgHTVegqPJoU/oU7HVBAOqbnex1/v9dfr7mbUMGVlsPWzCsIrBXrFDKA8d4
         P4MNH1Dt7kOy/6WuRgz1YFvbGHM8pLmoStAgnRdrGPJcBm261CCYMAq1J58nGB8O+e7Q
         O3Us7Cw61+lTQE5pM2ORkEPGWlw8si2aeuvdmiIU3FXjBn38dYiYRcJ5ENRDYO/aiAjB
         YG12nlvb4BV6GSELiRfuu91sca2x0f25aaZVrzwZ/S/mX0tD4jP+GzBagRH4TPZhaCBn
         O06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=00H2UQskZ5BXFtSo5pT85vCwfFrt+jrlaI23InYpzlM=;
        b=Cll1J4m4f6SObTFSJh0AbY9iCbEa771Xn80F9TV5hd7o2LPSGlDosEVj822eghrwXw
         4cAbEeFkch5FaaVBem8h8kQhAfjtnoUqcc+OQ4pnbTrJABGG0m1Ek+SnQCTNSqcG3x7u
         CwJxRjeEvVB17hjDL1zk6J5aC9jKmzvsT9kYR6wPCc9hXANXV4qXSRY+EOAdUSVQoUEx
         tfq1pPlxVhpTabwBCjXbOkwztXDs33h468LjcUHsIbxZ7MNylcMdNp7eRbgUF6OQCxg2
         znQiH/Lv9U6GiolN/81aUCxZISDYMdE95hda9vywT99XA1TKxQ9aN6K8n5QDY7Ix1fGX
         JJNQ==
X-Gm-Message-State: APjAAAWjMRB/WZDsDicmfbLM+ztoxN2W9K3d9dTmJU48Xb58UP1CgxYi
        jN7EVstPUoEwquvpnPETImpMbQW8UtTOEkoGXak=
X-Google-Smtp-Source: APXvYqze/3OcMUAafUZUHIiSmAOEmimgQ7d2zBg/O+CUSvkCG4z0juLnSsxKhd9Cat2zmEA1yJuhWp645sFLyFWvI3E=
X-Received: by 2002:a2e:2c07:: with SMTP id s7mr6118628ljs.44.1565212017407;
 Wed, 07 Aug 2019 14:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190807203153.11778-1-festevam@gmail.com> <CAOMZO5B_3d2DYMzpchJmM9CnRL0gN6-8zGeB_zorN-0cL8rbKA@mail.gmail.com>
 <CAHQ1cqERSwrRvM-ecgH6e1niqOA_uMywzNgVx86-Wy03RwHxZg@mail.gmail.com>
In-Reply-To: <CAHQ1cqERSwrRvM-ecgH6e1niqOA_uMywzNgVx86-Wy03RwHxZg@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 7 Aug 2019 18:07:21 -0300
Message-ID: <CAOMZO5Cz=F-j212EvCzfdeVtCC-Z0M-7xxzKJ8SvWVwPx=vVSg@mail.gmail.com>
Subject: Re: [PATCH] i2c: imx: Fix endlessly clk warnings
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 7, 2019 at 6:02 PM Andrey Smirnov <andrew.smirnov@gmail.com> wrote:

> > Maybe Andrey could resend it with the Fixes tag so that it can be
> > backported to stable.
> >
>
> Sure, will do.

When you resend it, please add:

Tested-by: Fabio Estevam <festevam@gmail.com>

Thanks
