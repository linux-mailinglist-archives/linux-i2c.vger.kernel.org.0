Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDFD01F68DE
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jun 2020 15:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbgFKNLR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Jun 2020 09:11:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:34188 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726673AbgFKNLR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 11 Jun 2020 09:11:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 0DE44AF0C;
        Thu, 11 Jun 2020 13:11:20 +0000 (UTC)
Date:   Thu, 11 Jun 2020 15:11:10 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH] i2c: Use separate MODULE_AUTHOR() statements for
 multiple authors
Message-ID: <20200611151110.7774a208@endymion>
In-Reply-To: <1bea211b-6047-a8f1-08f1-3ef82fd04211@linux.intel.com>
References: <20200610141142.2598882-1-jarkko.nikula@linux.intel.com>
        <20200611120218.7324a7a7@endymion>
        <1bea211b-6047-a8f1-08f1-3ef82fd04211@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 11 Jun 2020 13:23:24 +0300, Jarkko Nikula wrote:
> Hi
> 
> On 6/11/20 1:02 PM, Jean Delvare wrote:
> > Hi Jarrko,
> > 
> > On Wed, 10 Jun 2020 17:11:42 +0300, Jarkko Nikula wrote:  
> >> Modules with multiple authors should use multiple MODULE_AUTHOR()
> >> statements. Split the i2c modules with multiple authors to use multiple
> >> MODULE_AUTHOR() statements.  
> > 
> > Out of curiosity, is this documented anywhere, and what is the
> > rationale? FWIW, this change slightly increases the binary size of the
> > modules.
> >   
> I randomly spotted it in i2c-i801.c and started wonder since typically 
> I've seen multiple MODULE_AUTHOR() lines. Only mention about it I 
> quickly found was in include/linux/module.h:
> 
> /*
>   * Author(s), use "Name <email>" or just "Name", for multiple
>   * authors use multiple MODULE_AUTHOR() statements/lines.
>   */
> #define MODULE_AUTHOR(_author) MODULE_INFO(author, _author)

OK, that's authoritative enough for sure. Go ahead! :-)

-- 
Jean Delvare
SUSE L3 Support
