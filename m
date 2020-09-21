Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E99502720A0
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbgIUKXp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:23:45 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9035 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbgIUKXc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 06:23:32 -0400
X-Greylist: delayed 300 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Sep 2020 06:23:30 EDT
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f687dc90001>; Mon, 21 Sep 2020 03:17:45 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 10:18:30 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 21 Sep 2020 10:18:27 +0000
From:   Thierry Reding <treding@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 00/34] Improvements for Tegra I2C driver
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <c075bd7a03eb475682fdc6896c937b84@HQMAIL111.nvidia.com>
Date:   Mon, 21 Sep 2020 10:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600683465; bh=fpNBRs1/rzyxux9QTGVFi1H8epdj+qqxFxiwB+Dun9E=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=UA4t7occ6C30M/dnhfAcf0FtI+gty/hLvXwSBuM6wfl805gs+5Zjk5HtioJWeLXgb
         qAoYli7C+12qQPkssjvlXwemku2wIETo9mK9rnHTdZbOyyAhxKrxhbE078sHwj9WnB
         tBDiXrO9vEWY56wzs5b2J33bBymLB956xW0hTuzOB+HE8wLTBG3Lv5RZ9uqGlWdy3o
         Zbc/LTpKUGjd13Hxtav6JGBJ+vnlV9s/oQne2iwrerFAw0N43Fh+UgZyn1nCePbnyH
         4g9ZAfpjwLZ0UwcBzehaWSEUx1gFGQ+8Pj3E96/AqjYUTiMTK9oYEAxwzUBnc5rwMh
         cEHqwil8hK+yw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 09 Sep 2020 01:39:32 +0300, Dmitry Osipenko wrote:
> Hello!
>=20
> This series performs refactoring of the Tegra I2C driver code and hardens
> the atomic-transfer mode.
>=20
> Changelog:
>=20
> v7: - Reworked the "Clean up probe function" patch by moving out all
>       variable renamings into the "Clean up variable names" patch.
>       This results in a nicer diff, which was asked by Andy Shevchenko.
>=20
>     - Squashed "Improve coding style of tegra_i2c_wait_for_config_load()"
>       patch into "Factor out register polling into separate function" in
>       order avoid unnecessary ping-pong changes, which was asked by
>       Andy Shevchenko.
>=20
>     - Added more indentation improvements, it should be ideal now.
>=20
>     - I haven't changed order of the "Clean up variable types" patch,
>       which was suggested by Andy Shevchenko, because I already moved
>       that patch multiple times and we decided to sort patches starting
>       with more important cleanups and down to less important. The type
>       changes are more important than shuffling code around, IMO.
>=20
> v6: - Added new patch that adds missing RPM puts, thanks to Andy Shevchenko
>       for the suggestion.
>=20
>     - Improved commit messages by extending them with more a more detailed
>       explanation of the changes.
>=20
>     - Added clarifying comment to the "Use reset_control_reset()" change,
>       which was asked by Andy Shevchenko.
>=20
>     - Refactored the "Clean up probe function" patch by moving the
>       dev_err_probe() change into the "Use clk-bulk helpers" patch,
>       which was suggested by Andy Shevchenko.
>=20
>     - Improved ordering of the patches like it was suggested by
>       Andy Shevchenko.
>=20
>     - Added Andy Shevchenko to suggested-by of the "Use clk-bulk helpers"
>       patch.
>=20
>     - Improved "Remove i2c_dev.clk_divisor_non_hs_mode member" patch by
>       making the case-switch to use "fast plus mode" timing if clock rate
>       is out-of-range. Just to make it more consistent.
>=20
>     - The "Improve tegra_i2c_dev structure" patch is squashed into
>      "Improve formatting of variables" and "Clean up types/names" patches.
>=20
>     - All variable-renaming changes are squashed into a single "Clean up
>       variable names" patch.
>=20
>     - Made extra minor improvement to various patches, like more comments
>       and indentations improved.
>=20
> v5: - Dropped the "Factor out runtime PM and hardware initialization"
>       patch, like it was suggested by Micha=C5=82 Miros=C5=82aw. Instead a =
less
>       invasive "Factor out hardware initialization into separate function"
>       patch added, it doesn't touch the RPM initialization.
>=20
>     - The "Remove outdated barrier()" patch now removes outdated comments.
>=20
>     - Updated commit description of the "Remove "dma" variable" patch,
>       saying that the transfer mode may be changed by a callee. This was
>       suggested by Micha=C5=82 Miros=C5=82aw.
>=20
>     - Reworked the "Clean up and improve comments" patch. Couple more
>       comments are corrected and reworded now.
>=20
>     - Added r-b's from Micha=C5=82 Miros=C5=82aw.
>=20
>     - New patches:
>=20
>         i2c: tegra: Mask interrupt in tegra_i2c_issue_bus_clear()
>         i2c: tegra: Remove redundant check in tegra_i2c_issue_bus_clear()
>         i2c: tegra: Don't fall back to PIO mode if DMA configuration fails
>         i2c: tegra: Clean up variable types
>         i2c: tegra: Improve tegra_i2c_dev structure
>=20
> v4: - Reordered patches in the fixes/features/cleanups order like it was
>       suggested by Andy Shevchenko.
>=20
>     - Now using clk-bulk API, which was suggested by Andy Shevchenko.
>=20
>     - Reworked "Make tegra_i2c_flush_fifos() usable in atomic transfer"
>       patch to use iopoll API, which was suggested by Andy Shevchenko.
>=20
>     - Separated "Clean up probe function" into several smaller patches.
>=20
>     - Squashed "Add missing newline before returns" patch into
>       "Clean up whitespaces, newlines and indentation".
>=20
>     - The "Drop '_timeout' from wait/poll function names" is renamed to
>       "Rename wait/poll functions".
>=20
>     - The "Use reset_control_reset()" is changed to not fail tegra_i2c_init=
(),
>       but only emit warning. This should be more friendly behaviour in oppo=
se
>       to having a non-bootable machine if reset-control fails.
>=20
>     - New patches:
>=20
>         i2c: tegra: Remove error message used for devm_request_irq() failure
>         i2c: tegra: Use devm_platform_get_and_ioremap_resource()
>         i2c: tegra: Use platform_get_irq()
>         i2c: tegra: Use clk-bulk helpers
>         i2c: tegra: Remove bogus barrier()
>         i2c: tegra: Factor out register polling into separate function
>         i2c: tegra: Consolidate error handling in tegra_i2c_xfer_msg()
>         i2c: tegra: Clean up and improve comments
>         i2c: tegra: Rename couple "ret" variables to "err"
>=20
> v3: - Optimized "Make tegra_i2c_flush_fifos() usable in atomic transfer"
>       patch by pre-checking FIFO state before starting to poll using
>       ktime API, which may be expensive under some circumstances.
>=20
>     - The "Clean up messages in the code" patch now makes all messages
>       to use proper capitalization of abbreviations. Thanks to Andy Shevche=
nko
>       and Micha=C5=82 Miros=C5=82aw for the suggestion.
>=20
>     - The "Remove unnecessary whitespaces and newlines" patch is transformed
>       into "Clean up whitespaces and newlines", it now also adds missing
>       newlines and spaces.
>=20
>     - Reworked the "Clean up probe function" patch in accordance to
>       suggestion from Micha=C5=82 Miros=C5=82aw by factoring out only parts=
 of
>       the code that make error unwinding cleaner.
>=20
>     - Added r-b from Micha=C5=82 Miros=C5=82aw.
>=20
>     - Added more patches:
>=20
>         i2c: tegra: Reorder location of functions in the code
>         i2c: tegra: Factor out packet header setup from tegra_i2c_xfer_msg()
>         i2c: tegra: Remove "dma" variable
>         i2c: tegra: Initialization div-clk rate unconditionally
>         i2c: tegra: Remove i2c_dev.clk_divisor_non_hs_mode member
>=20
> v2: - Cleaned more messages in the "Clean up messages in the code" patch.
>=20
>     - The error code of reset_control_reset() is checked now.
>=20
>     - Added these new patches to clean up couple more things:
>=20
>         i2c: tegra: Check errors for both positive and negative values
>         i2c: tegra: Improve coding style of tegra_i2c_wait_for_config_load()
>         i2c: tegra: Remove unnecessary whitespaces and newlines
>         i2c: tegra: Rename variable in tegra_i2c_issue_bus_clear()
>         i2c: tegra: Improve driver module description
>=20
> Dmitry Osipenko (34):
>   i2c: tegra: Make tegra_i2c_flush_fifos() usable in atomic transfer
>   i2c: tegra: Add missing pm_runtime_put()
>   i2c: tegra: Handle potential error of tegra_i2c_flush_fifos()
>   i2c: tegra: Mask interrupt in tegra_i2c_issue_bus_clear()
>   i2c: tegra: Initialize div-clk rate unconditionally
>   i2c: tegra: Remove i2c_dev.clk_divisor_non_hs_mode member
>   i2c: tegra: Runtime PM always available on Tegra
>   i2c: tegra: Remove error message used for devm_request_irq() failure
>   i2c: tegra: Use reset_control_reset()
>   i2c: tegra: Use devm_platform_get_and_ioremap_resource()
>   i2c: tegra: Use platform_get_irq()
>   i2c: tegra: Use clk-bulk helpers
>   i2c: tegra: Move out all device-tree parsing into tegra_i2c_parse_dt()
>   i2c: tegra: Clean up probe function
>   i2c: tegra: Reorder location of functions in the code
>   i2c: tegra: Clean up variable types
>   i2c: tegra: Remove outdated barrier()
>   i2c: tegra: Remove likely/unlikely from the code
>   i2c: tegra: Remove redundant check in tegra_i2c_issue_bus_clear()
>   i2c: tegra: Remove "dma" variable from tegra_i2c_xfer_msg()
>   i2c: tegra: Don't fall back to PIO mode if DMA configuration fails
>   i2c: tegra: Rename wait/poll functions
>   i2c: tegra: Factor out error recovery from tegra_i2c_xfer_msg()
>   i2c: tegra: Factor out packet header setup from tegra_i2c_xfer_msg()
>   i2c: tegra: Factor out register polling into separate function
>   i2c: tegra: Factor out hardware initialization into separate function
>   i2c: tegra: Check errors for both positive and negative values
>   i2c: tegra: Consolidate error handling in tegra_i2c_xfer_msg()
>   i2c: tegra: Improve formatting of variables
>   i2c: tegra: Clean up variable names
>   i2c: tegra: Clean up printk messages
>   i2c: tegra: Clean up and improve comments
>   i2c: tegra: Clean up whitespaces, newlines and indentation
>   i2c: tegra: Improve driver module description
>=20
>  drivers/i2c/busses/i2c-tegra.c | 1435 ++++++++++++++++----------------
>  1 file changed, 701 insertions(+), 734 deletions(-)
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Test results:
  14 builds: 14 pass, 0 fail
   9 boots:  9 pass, 0 fail
  47 tests:  47 pass, 0 fail

Boards tested: tegra20-ventana, tegra30-cardhu-a04, tegra124-jetson-tk1,
               tegra186-p2771-0000, tegra194-p2972-0000
