Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F08D423EA99
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 11:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgHGJky (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 05:40:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:37854 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726854AbgHGJkx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Aug 2020 05:40:53 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id B539DAF70;
        Fri,  7 Aug 2020 09:41:09 +0000 (UTC)
Date:   Fri, 7 Aug 2020 11:40:51 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools] tools: allow to preset TOOLS_CFLAGS and
 TOOLS_LDFLAGS
Message-ID: <20200807114051.099ee040@endymion>
In-Reply-To: <20200805220555.9050-1-wsa@kernel.org>
References: <20200805220555.9050-1-wsa@kernel.org>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu,  6 Aug 2020 00:05:55 +0200, Wolfram Sang wrote:
> Sometimes I need to add some flags (like -static for the linker), so
> allow this.

Does USE_STATIC_LIB=1 not work for you?

> 
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> ---
> 
> Jean, what do you think?

Fine with me. However for consistency I think it would make sense to do
the same in eeprog/Module.mk and lib/Module.mk?

-- 
Jean Delvare
SUSE L3 Support
