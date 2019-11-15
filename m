Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6D15FD464
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Nov 2019 06:32:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbfKOFcE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Nov 2019 00:32:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:60818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726196AbfKOFcD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 Nov 2019 00:32:03 -0500
Received: from localhost (unknown [104.132.150.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E4C6C206D6;
        Fri, 15 Nov 2019 05:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573795923;
        bh=jWmwPTqwzaULpmOVTdyA4AJOtquR1tIUGfOksqQnoSc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BWimSRyfF9HSB3fc7Hp5DVV8OtTNv3YRaU+Uk+qYl/sRnM1LMAc3RfWnzthhn3L1A
         TKA4Lp4L1yg95gdxtHXP+e0VpHf5zTnogO5p5YSo8UHqlCVYh2kRFXYRZLmmGU3ptG
         4pYoJIjuaLMBW4ZkhrtqGGETP640NtvXeco6eR/g=
Date:   Fri, 15 Nov 2019 13:32:01 +0800
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, kernel-team@android.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: of: Populate fwnode in of_i2c_get_board_info()
Message-ID: <20191115053201.GA800105@kroah.com>
References: <20191115045049.261104-1-saravanak@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115045049.261104-1-saravanak@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 14, 2019 at 08:50:48PM -0800, Saravana Kannan wrote:
> This allows the of_devlink feature to work across i2c devices too. This
> avoid unnecessary probe deferrals of i2c devices, defers consumers of
> i2c devices till the i2c devices probe, and allows i2c drivers to
> implement sync_state() callbacks.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
> The of_devlink feature is present in driver-core-next branch. It started
> off with [1] but it has been improving since then.
> 
> [1] -- https://lore.kernel.org/linux-acpi/20190904211126.47518-1-saravanak@google.com/
> 
>  drivers/i2c/i2c-core-of.c | 1 +
>  1 file changed, 1 insertion(+)

Wolfram, I can take this through my tree now if you have no objections
to this.

thanks,

greg k-h
