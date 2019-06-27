Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E65AE5843D
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2019 16:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbfF0OIw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jun 2019 10:08:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:56438 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726829AbfF0OIw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 Jun 2019 10:08:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 77B52ABD4
        for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2019 14:08:51 +0000 (UTC)
Date:   Thu, 27 Jun 2019 16:08:50 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: Can't rmmod i2c-i801
Message-ID: <20190627160850.768c3128@endymion>
In-Reply-To: <20190627134123.41c10609@endymion>
References: <20190627134123.41c10609@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 27 Jun 2019 13:41:23 +0200, Jean Delvare wrote:
> On my system, i2c-i801 gets loaded automatically. I am working on this
> driver today so I'd like to be able to rmmod and modprobe it again.
> However rmmod doesn't work because someone is holding a reference to
> the module:
> 
> > /sbin/lsmod | grep ^i2c_i801  
> i2c_i801               36864  1
> 
> How do I figure out who is holding that reference and how do I get rid
> of it?

Bah, ignore me. My own code is doing it. Apparently the kernel doesn't
like infinite loops during module initialization.

-- 
Jean Delvare
SUSE L3 Support
