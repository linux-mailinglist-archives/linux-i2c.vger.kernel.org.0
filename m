Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F25713BE26
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 12:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729585AbgAOLEu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 06:04:50 -0500
Received: from mx2.suse.de ([195.135.220.15]:52934 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729127AbgAOLEu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Jan 2020 06:04:50 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id DB700AC81;
        Wed, 15 Jan 2020 11:04:48 +0000 (UTC)
Date:   Wed, 15 Jan 2020 12:04:47 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/3] i2c: parport-light: remove driver
Message-ID: <20200115120447.1596a6ce@endymion>
In-Reply-To: <20200113210643.5033-2-wsa+renesas@sang-engineering.com>
References: <20200113210643.5033-1-wsa+renesas@sang-engineering.com>
        <20200113210643.5033-2-wsa+renesas@sang-engineering.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 13 Jan 2020 22:06:41 +0100, Wolfram Sang wrote:
> The justification of a light version of the parport driver was less
> overhead for embedded systems. Well, today, even if an embedded system
> still has a parport, it surely can handle the fully-fledged parport
> driver. Remove it to reduce the maintenance burden.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  .../i2c/busses/i2c-parport-light.rst          |  24 --
>  Documentation/i2c/busses/index.rst            |   1 -
>  MAINTAINERS                                   |   2 -
>  drivers/i2c/busses/Kconfig                    |  28 --
>  drivers/i2c/busses/Makefile                   |   1 -
>  drivers/i2c/busses/i2c-parport-light.c        | 267 ------------------
>  6 files changed, 323 deletions(-)
>  delete mode 100644 Documentation/i2c/busses/i2c-parport-light.rst
>  delete mode 100644 drivers/i2c/busses/i2c-parport-light.c
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>


-- 
Jean Delvare
SUSE L3 Support
