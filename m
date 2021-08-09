Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2E73E4106
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Aug 2021 09:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233589AbhHIHqw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Aug 2021 03:46:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:41236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233568AbhHIHqt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 9 Aug 2021 03:46:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDC0861053;
        Mon,  9 Aug 2021 07:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628495189;
        bh=qEdukQisnms5CZNdIJhgQ8R069SsCC33oJlXcsFD324=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ovlF44Fm5NK6R+HRCtLLWwJryyerA2wx4g/yKxDBTMe8tStso56k3QDJgQ2OZmEMX
         I+MqvvwbG46ewBX56e3SruyI4y4Ql89PlD0WZZmXyLjt3LBsBXSt5vgCy4Iy3iseA+
         JYc9WhI/+JhuDufXoTmU4A2XIevGLeeYgp2pviji/tNzaFWQzeQfMwUOCRRgSmxD/m
         Aebvtu0H3wCmfx+maC59heFPrRLd/sWL/1+2+cRU4T9pcJ58vThGT7fPkenTCEcvmX
         LtXhECGICWH+ScNuT2xz9c7n21LoUsy264ATXX5FPvq4t9bY2nd+izy7wdmSt2Kc28
         W9sC//dOnmGxQ==
Date:   Mon, 9 Aug 2021 15:46:23 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Raag Jadav <raagjadav@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] arm64: dts: ls1046a: fix eeprom entries
Message-ID: <20210809074623.GN30984@dragon>
References: <1628105086-8172-1-git-send-email-raagjadav@gmail.com>
 <1628105086-8172-2-git-send-email-raagjadav@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1628105086-8172-2-git-send-email-raagjadav@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 05, 2021 at 12:54:45AM +0530, Raag Jadav wrote:
> ls1046afrwy and ls1046ardb boards have CAT24C04[1] and CAT24C05[2]
> eeproms respectively. Both are 4Kb (512 bytes) in size,
> and compatible with AT24C04[3].
> Remove multi-address entries, as both the boards have a single chip each.
> 
> [1] https://www.onsemi.com/pdf/datasheet/cat24c01-d.pdf
> [2] https://www.onsemi.com/pdf/datasheet/cat24c03-d.pdf
> [3] https://ww1.microchip.com/downloads/en/DeviceDoc/doc0180.pdf
> 
> Signed-off-by: Raag Jadav <raagjadav@gmail.com>

Applied, thanks!
