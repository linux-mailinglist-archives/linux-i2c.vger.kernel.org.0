Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C28B1427CE
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2020 11:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgATKEa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jan 2020 05:04:30 -0500
Received: from mx2.suse.de ([195.135.220.15]:44632 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726075AbgATKEa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Jan 2020 05:04:30 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 4B48CABB3;
        Mon, 20 Jan 2020 10:04:28 +0000 (UTC)
Date:   Mon, 20 Jan 2020 11:04:26 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/26] docs: i2c: summary: rewrite the "terminology"
 section
Message-ID: <20200120110426.56490833@endymion>
In-Reply-To: <20200105225012.11701-3-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
        <20200105225012.11701-1-luca@lucaceresoli.net>
        <20200105225012.11701-3-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun,  5 Jan 2020 23:49:49 +0100, Luca Ceresoli wrote:
> This section, partly dating back to the pre-git era, is somewhat
> unclear and partly incorrect. Rewrite it almost completely including a
> reference figure, concise but precise definition of each term and the
> paths where drivers are found. Particular care has been put in clarifying
> the relation between adapter and algorithm, which has no correspondence
> in the I2C spec terminology.

It may make sense to mention path "drivers/i2c/algos/" in the paragraph
which mentions reusable algorithms.

> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Documentation/i2c/i2c.svg     | 1341 +++++++++++++++++++++++++++++++++
>  Documentation/i2c/summary.rst |   35 +-
>  2 files changed, 1362 insertions(+), 14 deletions(-)
>  create mode 100644 Documentation/i2c/i2c.svg
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
