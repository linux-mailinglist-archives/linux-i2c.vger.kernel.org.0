Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B32F114861B
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2020 14:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387949AbgAXN2i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jan 2020 08:28:38 -0500
Received: from mx2.suse.de ([195.135.220.15]:59086 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387722AbgAXN2i (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Jan 2020 08:28:38 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id DA41EAD41;
        Fri, 24 Jan 2020 13:28:36 +0000 (UTC)
Date:   Fri, 24 Jan 2020 14:28:35 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/28] docs: i2c: summary: rewrite the "terminology"
 section
Message-ID: <20200124142835.1a5891e7@endymion>
In-Reply-To: <20200123135103.20540-4-luca@lucaceresoli.net>
References: <20200123135103.20540-1-luca@lucaceresoli.net>
        <20200123135103.20540-4-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 23 Jan 2020 14:50:38 +0100, Luca Ceresoli wrote:
> This section, partly dating back to the pre-git era, is somewhat
> unclear and partly incorrect. Rewrite it almost completely including a
> reference figure, concise but precise definition of each term and the
> paths where drivers are found. Particular care has been put in clarifying
> the relation between adapter and algorithm, which has no correspondence
> in the I2C spec terminology.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 
> ---
> 
> Changes in v2:
>  - mention the drivers/i2c/algos/ directory when introducing algos
>    (Jean Delvare)
> ---
>  Documentation/i2c/i2c.svg     | 1341 +++++++++++++++++++++++++++++++++
>  Documentation/i2c/summary.rst |   36 +-
>  2 files changed, 1363 insertions(+), 14 deletions(-)
>  create mode 100644 Documentation/i2c/i2c.svg
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
