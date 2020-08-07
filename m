Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9C6F23EFAF
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 16:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgHGOzh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 10:55:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:50464 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726061AbgHGOzh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Aug 2020 10:55:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 936B9AB7D;
        Fri,  7 Aug 2020 14:55:54 +0000 (UTC)
Date:   Fri, 7 Aug 2020 16:55:35 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools] tools: allow to preset TOOLS_CFLAGS and
 TOOLS_LDFLAGS
Message-ID: <20200807165535.3baca95d@endymion>
In-Reply-To: <20200807094247.GB1178@kunai>
References: <20200805220555.9050-1-wsa@kernel.org>
        <20200807114051.099ee040@endymion>
        <20200807094247.GB1178@kunai>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 7 Aug 2020 11:42:47 +0200, Wolfram Sang wrote:
> > > Sometimes I need to add some flags (like -static for the linker), so
> > > allow this.  
> > 
> > Does USE_STATIC_LIB=1 not work for you?  
> 
> For some embedded devices, I need full static because they use a libc I
> don't have at hand.

OK, if you think there are more people interested, feel free to
introduce another Makefile variable (STATIC_BUILD=1 for example) and
use that. Whatever makes your life easier really.

-- 
Jean Delvare
SUSE L3 Support
