Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30C641426A3
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2020 10:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgATJIy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jan 2020 04:08:54 -0500
Received: from mx2.suse.de ([195.135.220.15]:59260 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgATJIy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Jan 2020 04:08:54 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 0A8D2B254;
        Mon, 20 Jan 2020 09:08:52 +0000 (UTC)
Date:   Mon, 20 Jan 2020 10:08:50 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/26] docs: i2c: sort index logically
Message-ID: <20200120100850.001e032b@endymion>
In-Reply-To: <20200105225012.11701-1-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
        <20200105225012.11701-1-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Luca,

On Sun,  5 Jan 2020 23:49:47 +0100, Luca Ceresoli wrote:
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

Good idea. I wonder, would there be a way to materialize these group
names in the documentation itself? I found it useful when reviewing the
patch, but in the long term it would be even more useful if the end
readers would see them too.

> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Documentation/i2c/index.rst | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/i2c/index.rst b/Documentation/i2c/index.rst
> index a0fbaf6d0675..bd0ff9d00793 100644
> --- a/Documentation/i2c/index.rst
> +++ b/Documentation/i2c/index.rst
> @@ -7,27 +7,26 @@ I2C/SMBus Subsystem
>  .. toctree::
>     :maxdepth: 1
>  
> +   summary
> +   i2c-protocol
> +   smbus-protocol
> +   instantiating-devices
> +   busses/index
> +   i2c-topology
> +   muxes/i2c-mux-gpio
> +   writing-clients
>     dev-interface
>     dma-considerations
>     fault-codes
>     functionality
>     gpio-fault-injection
> -   i2c-protocol
>     i2c-stub
> -   i2c-topology
> -   instantiating-devices
> -   old-module-parameters
> -   slave-eeprom-backend
>     slave-interface
> -   smbus-protocol
> -   summary
> +   slave-eeprom-backend
>     ten-bit-addresses
>     upgrading-clients
> -   writing-clients
> -
> -   muxes/i2c-mux-gpio
> +   old-module-parameters
>  
> -   busses/index
>  

You end up with 2 blank lines in a row here, ideally there should be
only one left.

>  .. only::  subproject and html
>  

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
