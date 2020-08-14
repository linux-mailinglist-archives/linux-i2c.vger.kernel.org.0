Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80112244EA6
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Aug 2020 21:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgHNTFB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Aug 2020 15:05:01 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:54210 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726196AbgHNTFB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Aug 2020 15:05:01 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1k6f0d-009Qr4-LD; Fri, 14 Aug 2020 21:04:59 +0200
Date:   Fri, 14 Aug 2020 21:04:59 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Mohammed Billoo <mab@mab-labs.com>
Cc:     Peter Korsgaard <peter@korsgaard.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: ocores: add gaisler to platform data
Message-ID: <20200814190459.GE2239279@lunn.ch>
References: <20200814163134.29493-1-mab@mab-labs.com>
 <20200814164907.GB2239279@lunn.ch>
 <CALkjhPo3BGRDao=Rz9S5Xxf1bubBXv7WEGu6B=5V1WvnmGUmwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALkjhPo3BGRDao=Rz9S5Xxf1bubBXv7WEGu6B=5V1WvnmGUmwg@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 14, 2020 at 02:53:20PM -0400, Mohammed Billoo wrote:
> Andrew,
> 
> Thanks for the feedback. That makes sense.
> 
> My use case was very specific that required these changes and I thought I'd
> push them upstream for others. Basically, we have an FPGA over PCI that has
> some IP, vendor-specific bridging to AHB, and then grlib to go to i2c (among
> other controllers). When we load the pci driver we create and add a mfd device
> that has the specific BAR as the resource, and the offset within the BAR for
> the i2c controller. Looking back, all of this could be added to the device
> tree, so what we've done so far may be an anti-pattern. 
> 
> Would you still want this patch?

I would prefer device tree.

  Andrew
