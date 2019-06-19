Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2355E4C3EB
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 01:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbfFSXDQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jun 2019 19:03:16 -0400
Received: from gate.crashing.org ([63.228.1.57]:48234 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726251AbfFSXDP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jun 2019 19:03:15 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x5JN2NFs022741;
        Wed, 19 Jun 2019 18:02:25 -0500
Message-ID: <4c8b9ca5e84db7db67ad552d8fdbaa17d11b6432.camel@kernel.crashing.org>
Subject: Re: [PATCH 1/2] i2c: aspeed: allow to customize base clock divisor
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Tao Ren <taoren@fb.com>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "ryan_chen@aspeedtech.com" <ryan_chen@aspeedtech.com>
Date:   Thu, 20 Jun 2019 09:02:23 +1000
In-Reply-To: <18565fcf-3dc1-b671-f826-e4417e4ad284@fb.com>
References: <20190619205009.4176588-1-taoren@fb.com>
         <CAFd5g45TMtXcuqONdkpN_K+c0O+wUw8wkGzcQfV+sO8p5Krc9w@mail.gmail.com>
         <18565fcf-3dc1-b671-f826-e4417e4ad284@fb.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 2019-06-19 at 22:32 +0000, Tao Ren wrote:
> Thank you for the quick response, Brendan.
> 
> Aspeed I2C bus frequency is defined by 3 parameters
> (base_clk_divisor, clk_high_width, clk_low_width), and I choose
> base_clk_divisor because it controls all the Aspeed I2C timings (such
> as setup time and hold time). Once base_clk_divisor is decided
> (either by the current logic in i2c-aspeed driver or manually set in
> device tree), clk_high_width and clk_low_width will be calculated by
> i2c-aspeed driver to meet the specified I2C bus speed.
> 
> For example, by setting I2C bus frequency to 100KHz on AST2500
> platform, (base_clock_divisor, clk_high_width, clk_low_width) is set
> to (3, 15, 14) by our driver. But some slave devices (on CMM i2c-8
> and Minipack i2c-0) NACK byte transactions with the default timing
> setting: the issue can be resolved by setting base_clk_divisor to 4,
> and (clk_high_width, clk_low_width) will be set to (7, 7) by our i2c-
> aspeed driver to achieve similar I2C bus speed.
> 
> Not sure if my answer helps to address your concerns, but kindly let
> me know if you have further questions/suggestions.

Did you look at the resulting output on a scope ? I'm curious what
might be wrong.... 

CCing Ryan from Aspeed, he might have some idea.

Could it be that with some specific dividers you have more jitter ?
Still, i2c devices tend to be rather robust vs crappy clocks unless you
are massively out of bounds, which makes me wonder whether something
else might be wrong in your setup.

Cheers,
Ben.


