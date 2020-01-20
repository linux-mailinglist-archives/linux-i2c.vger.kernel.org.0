Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE57114288B
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2020 11:53:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgATKwK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jan 2020 05:52:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:59286 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726148AbgATKwK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Jan 2020 05:52:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 3B776ABB3;
        Mon, 20 Jan 2020 10:52:08 +0000 (UTC)
Date:   Mon, 20 Jan 2020 11:51:57 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/26] docs: i2c: i2c-protocol: fix kernel-doc function
 syntax
Message-ID: <20200120115157.6536b664@endymion>
In-Reply-To: <20200105225012.11701-7-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
        <20200105225012.11701-1-luca@lucaceresoli.net>
        <20200105225012.11701-7-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun,  5 Jan 2020 23:49:53 +0100, Luca Ceresoli wrote:
> This clarifies these are functions and adds a hyperlink to the function
> documentation.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Documentation/i2c/i2c-protocol.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
