Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2154B244EA2
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Aug 2020 21:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgHNTDB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Aug 2020 15:03:01 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:54204 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726623AbgHNTDB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Aug 2020 15:03:01 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1k6eyh-009QqK-4C; Fri, 14 Aug 2020 21:02:59 +0200
Date:   Fri, 14 Aug 2020 21:02:59 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Mohammed Billoo <mab@mab-labs.com>
Cc:     Peter Korsgaard <peter@korsgaard.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: ocores: add be/le support for gaisler
Message-ID: <20200814190259.GD2239279@lunn.ch>
References: <20200814163134.29493-1-mab@mab-labs.com>
 <20200814163134.29493-2-mab@mab-labs.com>
 <20200814165058.GC2239279@lunn.ch>
 <CALkjhPppeOwekp-ZJZ9QGfNGa=K5g6P+TWs42Anrb+QvFSrspQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALkjhPppeOwekp-ZJZ9QGfNGa=K5g6P+TWs42Anrb+QvFSrspQ@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 14, 2020 at 02:56:58PM -0400, Mohammed Billoo wrote:
> Sadly, this is a case of vendor-specific implementations causing indigestion.
> When this was implemented on the FPGA, the vendor-specific AHB bridge (we're
> going from PCI to AHB to grlib) had a built-in endianness conversion which we
> didn't want and found out later. Since it was easier to add the big endian
> accessor on the software side instead of redoing the FPGA design, we opted for
> the former. 

O.K. So please document this is a workaround for broken hardware.
Otherwise other people are going to ask the same question. Add it to
the commit message at least.

    Andrew
