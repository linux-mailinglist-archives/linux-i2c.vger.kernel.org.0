Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 499FC3265AC
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Feb 2021 17:39:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbhBZQjG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Feb 2021 11:39:06 -0500
Received: from mx2.suse.de ([195.135.220.15]:34466 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230001AbhBZQjD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Feb 2021 11:39:03 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7724BAB8C;
        Fri, 26 Feb 2021 16:38:20 +0000 (UTC)
Date:   Fri, 26 Feb 2021 17:38:19 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools] remove 'eepromer' subdir
Message-ID: <20210226173819.3c899219@endymion>
In-Reply-To: <20210115114321.394262-1-wsa@kernel.org>
References: <20210115114321.394262-1-wsa@kernel.org>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Fri, 15 Jan 2021 12:43:21 +0100, Wolfram Sang wrote:
> These tools are deprecated for 6 years now because we have better
> alternatives. They are not built by default. I think it is time we can
> remove them.
> 
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> ---
> 
> Jean, if you agree, I'll simply push this to the repo. This is why I
> sent the reduced patch here.
> 
>  eepromer/.gitignore      |   2 -
>  eepromer/Makefile        |  12 -
>  eepromer/README          |  34 --
>  eepromer/README.eeprom   |  87 -----
>  eepromer/README.eepromer |  29 --
>  eepromer/eeprom.8        |  64 ----
>  eepromer/eeprom.c        | 299 ----------------
>  eepromer/eepromer.8      |  61 ----
>  eepromer/eepromer.c      | 723 ---------------------------------------
>  9 files changed, 1311 deletions(-)
>  delete mode 100644 eepromer/.gitignore
>  delete mode 100644 eepromer/Makefile
>  delete mode 100644 eepromer/README
>  delete mode 100644 eepromer/README.eeprom
>  delete mode 100644 eepromer/README.eepromer
>  delete mode 100644 eepromer/eeprom.8
>  delete mode 100644 eepromer/eeprom.c
>  delete mode 100644 eepromer/eepromer.8
>  delete mode 100644 eepromer/eepromer.c
> 
> diff --git a/eepromer/.gitignore b/eepromer/.gitignore
> deleted file mode 100644
> index 5f76592..0000000
> diff --git a/eepromer/Makefile b/eepromer/Makefile
> deleted file mode 100644
> index b7d38f4..0000000
> diff --git a/eepromer/README b/eepromer/README
> deleted file mode 100644
> index 392c266..0000000
> diff --git a/eepromer/README.eeprom b/eepromer/README.eeprom
> deleted file mode 100644
> index b465d07..0000000
> diff --git a/eepromer/README.eepromer b/eepromer/README.eepromer
> deleted file mode 100644
> index 4f0648c..0000000
> diff --git a/eepromer/eeprom.8 b/eepromer/eeprom.8
> deleted file mode 100644
> index 0489590..0000000
> diff --git a/eepromer/eeprom.c b/eepromer/eeprom.c
> deleted file mode 100644
> index 78f5481..0000000
> diff --git a/eepromer/eepromer.8 b/eepromer/eepromer.8
> deleted file mode 100644
> index c3f3239..0000000
> diff --git a/eepromer/eepromer.c b/eepromer/eepromer.c
> deleted file mode 100644
> index 1536b15..0000000

Fine with me. The replacement tool (eeprog) has its issues, but whoever
cares can jump in and provide improvements and fixes.

Please remember to drop the reference to eepromer from the README file.

-- 
Jean Delvare
SUSE L3 Support
