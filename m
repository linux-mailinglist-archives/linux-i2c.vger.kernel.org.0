Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E646221E9B
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jul 2020 10:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgGPIka (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 04:40:30 -0400
Received: from mx2.suse.de ([195.135.220.15]:46594 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725921AbgGPIka (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Jul 2020 04:40:30 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C7F17B7AF;
        Thu, 16 Jul 2020 08:40:32 +0000 (UTC)
Date:   Thu, 16 Jul 2020 10:40:28 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Paul Schulz <paul@mawsonlakes.org>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] drivers/i2c: Removes 'blacklist' from file
Message-ID: <20200716104028.6bfd4608@endymion>
In-Reply-To: <20200716022249.148043-1-paul@mawsonlakes.org>
References: <20200716022249.148043-1-paul@mawsonlakes.org>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Paul,

On Thu, 16 Jul 2020 11:52:49 +0930, Paul Schulz wrote:
> This edit changes instances of 'blacklist' to 'blocklist'
> 
> This is a functionally trivial patch and has no other effect.
> 
> Signed-off-by: Paul Schulz <paul@mawsonlakes.org>
> ---
>  Documentation/i2c/busses/i2c-sis5595.rst | 2 +-
>  drivers/i2c/busses/i2c-sis5595.c         | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> (...)

I see where you are getting with this, but no, thanks.

-- 
Jean Delvare
SUSE L3 Support
