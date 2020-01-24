Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 124ED1485E7
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2020 14:24:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389539AbgAXNYM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 24 Jan 2020 08:24:12 -0500
Received: from mx2.suse.de ([195.135.220.15]:56172 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389518AbgAXNYL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Jan 2020 08:24:11 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id A1BFDB04C;
        Fri, 24 Jan 2020 13:24:09 +0000 (UTC)
Date:   Fri, 24 Jan 2020 14:24:08 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/28] docs: i2c: summary: extend introduction
Message-ID: <20200124142408.69d31966@endymion>
In-Reply-To: <20200123135103.20540-3-luca@lucaceresoli.net>
References: <20200123135103.20540-1-luca@lucaceresoli.net>
        <20200123135103.20540-3-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 23 Jan 2020 14:50:37 +0100, Luca Ceresoli wrote:
>  - state the "official" name (I²C, not I2C, according to the spec) at
>    the beginning but keep using the more practical I2C elsewhere
>  - mention some known different names
>  - add link to the specification document
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 
> ---
> 
> Changes in v2:
>  - clarify sentence (Jean Delvare)
> ---
>  Documentation/i2c/summary.rst | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
