Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5BEF214C4A
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Jul 2020 14:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgGEMAF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jul 2020 08:00:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:58158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726454AbgGEMAF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 5 Jul 2020 08:00:05 -0400
Received: from kernel.org (unknown [87.71.40.38])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CDE7120720;
        Sun,  5 Jul 2020 12:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593950404;
        bh=kCtDzGa6sESwkqW1jS5Ju+PECnwelbhLFgAQ84cF3nA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g62WjDbHSaKq+tJl/R6v6SJO0VGXo9S+jNEd+biGStIJrFnb8YxmPM8SiCVQRZs+T
         wCOkUpvw1hN8T07/GuA0Y5HVOwIDqidEpzT1zaF5+BimawG15JjLzzOQJrWS2GJTMk
         n5k8Y8w+y2xyUR5C6RMAStgIekUMFDIhMuhc7P7w=
Date:   Sun, 5 Jul 2020 14:59:58 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux MM <linux-mm@kvack.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: Documentation (mm & i2c) questions (doubled words)
Message-ID: <20200705115958.GH2999148@kernel.org>
References: <187c35da-041e-dcf3-d14e-7046f57d0606@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <187c35da-041e-dcf3-d14e-7046f57d0606@infradead.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jul 02, 2020 at 10:12:06AM -0700, Randy Dunlap wrote:
> 
> for MM:
> 
> in Documentation/admin-guide/mm/numaperf.rst:
> line 132-133:
> 
>   If that directory is not present, the system either does not not provide
>   a memory-side cache, or that information is not accessible to the kernel.
> 
> Is the double negative done on purpose or is it a typo/mistake?

It's a typo.
 
> for I2C:
> 
> in Documentation/i2c/upgrading-clients.rst:
> line 10-11:
> 
>   This guide outlines how to alter existing Linux 2.6 client drivers from
>   the old to the new new binding methods.
>                  ^^^^^^^
> 
> Is this like "really new" or newer than new?  or just a simple mistake?
> 
> 
> thanks.
> 
> -- 
> ~Randy
> 
> 

-- 
Sincerely yours,
Mike.
