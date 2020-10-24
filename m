Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E52C297E16
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Oct 2020 21:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1764016AbgJXTZy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Oct 2020 15:25:54 -0400
Received: from mail-ej1-f46.google.com ([209.85.218.46]:33134 "EHLO
        mail-ej1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762138AbgJXTZx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 24 Oct 2020 15:25:53 -0400
Received: by mail-ej1-f46.google.com with SMTP id c15so7359470ejs.0;
        Sat, 24 Oct 2020 12:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TLAjqKGwG9KBTJU+h2eNa+b2vfnfynxdcIStBSwg9s4=;
        b=Nz1JByMwwRHcazIElJbqmsD+e9PWAGptF50qtC1M20F/iv7uwE0pQ8Kqbjp/ixAhML
         uq1/OFEnGdUKOqNdaAcTjkR3l7aoEu3OnrCcXMS34zbzZ5R0+XcjrTZWr/jqQBHjVmO0
         LmxNfAKmvpwYj0SZcBOpjdyr3TOHTCci3NjImjJQgguRBKuNB4RmhNh3LWzyjKmXqIc4
         zJmxT88iMJ0JDIJU7z/EvuTsbTPODlwebVi9xFeRWI3Gpo9m4by/JM+2f4FO0AJ0skh4
         l0pSQs1dTyeupwJG5r/kxaZtXReG3vxQv4Jru4PeVYVlCA2Eo9ROSHA8aSm6hdy/kXFW
         ffsw==
X-Gm-Message-State: AOAM532FA6RnVuRb/34Yc0qarun2ESyDkc3hs8b7M0hRRUYxy9R0Q0/s
        wpY3Czv5YeKJ16mo1X2jWfuqnA7Ho6c=
X-Google-Smtp-Source: ABdhPJzcf8XrXm3mJJ7Wljc+hwwT4j290CugNtxIYbd12G5YdZmR/KiLSAgQHBZKsrjQLNwM7JqPEg==
X-Received: by 2002:a17:906:da03:: with SMTP id fi3mr6304618ejb.321.1603567551759;
        Sat, 24 Oct 2020 12:25:51 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
        by smtp.googlemail.com with ESMTPSA id m1sm2844109ejj.117.2020.10.24.12.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 12:25:49 -0700 (PDT)
Date:   Sat, 24 Oct 2020 21:25:47 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: Re: [PATCH 2/2] i2c: imx: remove id_table entry
Message-ID: <20201024192547.GA4638@kozik-lap>
References: <1603441103-17735-1-git-send-email-peng.fan@nxp.com>
 <1603441103-17735-2-git-send-email-peng.fan@nxp.com>
 <20201023152842.GA5227@kozik-lap>
 <DB6PR0402MB2760D2A54C69E7AAAB366C78881B0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DB6PR0402MB2760D2A54C69E7AAAB366C78881B0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Oct 24, 2020 at 07:47:13AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH 2/2] i2c: imx: remove id_table entry
> > 
> > On Fri, Oct 23, 2020 at 04:18:23PM +0800, peng.fan@nxp.com wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > The legacy platform device code has been removed under
> > > arch/arm/mach-imx, so we no need id_table entry here.
> > 
> > Cc: Greg, Geert, Angelo,
> > 
> > Aren't you breaking Coldfire platforms?
> 
> Ok, I see coldfire still use use imx1-i2c. Could we remove imx21-i2c or still
> keep it?

Did you check if anything else uses it?

Best regards,
Krzysztof
