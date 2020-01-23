Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6CC2146580
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 11:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbgAWKRn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 05:17:43 -0500
Received: from mx2.suse.de ([195.135.220.15]:46590 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726099AbgAWKRn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Jan 2020 05:17:43 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 8C291AEE9;
        Thu, 23 Jan 2020 10:17:41 +0000 (UTC)
Date:   Thu, 23 Jan 2020 11:17:40 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Lei YU <mine260309@gmail.com>, Wolfram Sang <wsa@the-dreams.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH 1/2] libi2c: Add a manual page to document the API
Message-ID: <20200123111740.728666a7@endymion>
In-Reply-To: <20200123110355.4cb793ce@endymion>
References: <20200123105246.67732e33@endymion>
        <20200123110355.4cb793ce@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 23 Jan 2020 11:03:55 +0100, Jean Delvare wrote:
> It is good practice for a library to come with a complete API description.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> ---
>  lib/libi2c.3 |  137 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 137 insertions(+)
> (...)

I just realized I forgot the integration with the Makefile so that the
manual page will get installed. Sorry about that, I'll fix that in v2.

-- 
Jean Delvare
SUSE L3 Support
