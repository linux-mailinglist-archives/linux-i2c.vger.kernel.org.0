Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D61E914853A
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2020 13:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730733AbgAXMfv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jan 2020 07:35:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:55108 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729774AbgAXMfv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Jan 2020 07:35:51 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id D8738ADB5;
        Fri, 24 Jan 2020 12:35:49 +0000 (UTC)
Date:   Fri, 24 Jan 2020 13:35:48 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/28] docs: i2c: sort index logically
Message-ID: <20200124133548.7f01344a@endymion>
In-Reply-To: <20200123135103.20540-2-luca@lucaceresoli.net>
References: <20200123135103.20540-1-luca@lucaceresoli.net>
        <20200123135103.20540-2-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 23 Jan 2020 14:50:36 +0100, Luca Ceresoli wrote:
> The index page currently lists sections in alphabetical file order without
> caring about their content. Sort sections based on their content logically,
> according to the following structure:
> 
>  * Intro to I2C/SMBus and their usage in Linux: summary, i2c-protocol,
>    smbus-protocol, instantiating-devices, busses/index, i2c-topology,
>    muxes/i2c-mux-gpio
>  * Implementing drivers: writing-clients, dev-interface,
>    dma-considerations, fault-codes, functionality
>  * Debugging: gpio-fault-injection, i2c-stub
>  * Slave I2C: slave-interface, slave-eeprom-backend
>  * Advanced: ten-bit-addresses
>  * Obsolete info: upgrading-clients, old-module-parameters
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 
> ---
> 
> Changes in v2:
>  - split sections in groups (suggested by Jean Delvare)
>  - remove consecutive blank lines (reported by Jean Delvare)
> ---
>  Documentation/i2c/index.rst | 59 ++++++++++++++++++++++++++++++-------
>  1 file changed, 48 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/i2c/index.rst b/Documentation/i2c/index.rst
> index a0fbaf6d0675..f0f3b9c97abb 100644
> --- a/Documentation/i2c/index.rst
> +++ b/Documentation/i2c/index.rst
> @@ -4,30 +4,67 @@
>  I2C/SMBus Subsystem
>  ===================
>  
> +Introduction
> +============
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   summary
> +   i2c-protocol
> +   smbus-protocol
> +   instantiating-devices
> +   busses/index
> +   i2c-topology
> +   muxes/i2c-mux-gpio
> +
> +

You still have a double blank line here, not sure if this is intended?

Looks good otherwise.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

> +Writing device drivers
> +======================
> +
>  .. toctree::
>     :maxdepth: 1
>  
> +   writing-clients
>     dev-interface
>     dma-considerations
>     fault-codes
>     functionality
> +
> +Debugging
> +=========
> +
> +.. toctree::
> +   :maxdepth: 1
> +
>     gpio-fault-injection
> -   i2c-protocol
>     i2c-stub
> -   i2c-topology
> -   instantiating-devices
> -   old-module-parameters
> -   slave-eeprom-backend
> +
> +Slave I2C
> +=========
> +
> +.. toctree::
> +   :maxdepth: 1
> +
>     slave-interface
> -   smbus-protocol
> -   summary
> +   slave-eeprom-backend
> +
> +Advanced topics
> +===============
> +
> +.. toctree::
> +   :maxdepth: 1
> +
>     ten-bit-addresses
> -   upgrading-clients
> -   writing-clients
>  
> -   muxes/i2c-mux-gpio
> +Legacy documentation
> +====================
>  
> -   busses/index
> +.. toctree::
> +   :maxdepth: 1
> +
> +   upgrading-clients
> +   old-module-parameters
>  
>  .. only::  subproject and html
>  


-- 
Jean Delvare
SUSE L3 Support
