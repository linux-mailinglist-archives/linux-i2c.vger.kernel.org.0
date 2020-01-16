Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6D5F13D712
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2020 10:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbgAPJjc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jan 2020 04:39:32 -0500
Received: from mx2.suse.de ([195.135.220.15]:35112 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726370AbgAPJjc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Jan 2020 04:39:32 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id A77F1B1C2;
        Thu, 16 Jan 2020 09:39:30 +0000 (UTC)
Date:   Thu, 16 Jan 2020 10:39:29 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/26] docs: i2c: call it "I2C" consistently
Message-ID: <20200116103929.366c14e0@endymion>
In-Reply-To: <20200105225012.11701-4-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
        <20200105225012.11701-1-luca@lucaceresoli.net>
        <20200105225012.11701-4-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun,  5 Jan 2020 23:49:50 +0100, Luca Ceresoli wrote:
> Uppercase "I2C" is used almost everywhere in the docs, but the lowercase
> version "i2c" is used somewhere. Use the uppercase form consistently.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Acked-by: Peter Rosin <peda@axentia.se>
> ---
>  Documentation/i2c/dev-interface.rst         | 18 +++---
>  Documentation/i2c/dma-considerations.rst    |  2 +-
>  Documentation/i2c/i2c-protocol.rst          |  4 +-
>  Documentation/i2c/i2c-topology.rst          | 66 ++++++++++-----------
>  Documentation/i2c/instantiating-devices.rst |  2 +-
>  Documentation/i2c/old-module-parameters.rst |  6 +-
>  Documentation/i2c/slave-interface.rst       |  4 +-
>  Documentation/i2c/writing-clients.rst       |  4 +-
>  8 files changed, 53 insertions(+), 53 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
