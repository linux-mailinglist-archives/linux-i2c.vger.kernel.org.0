Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E82EF362225
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Apr 2021 16:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234183AbhDPOYM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Apr 2021 10:24:12 -0400
Received: from mga05.intel.com ([192.55.52.43]:58771 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233916AbhDPOYL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Apr 2021 10:24:11 -0400
IronPort-SDR: Bt4GF+FuRQqU/l95hose+W77oPu0RAs+MJ3yNuwEi/pCr/Tx8q+YQtxAJU5WwYEMkyZc4rJKFK
 XCqhuZBI/TdQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9956"; a="280364393"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="280364393"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2021 07:23:46 -0700
IronPort-SDR: c+FI3oydeo1UnYvVMy7D0CuxTiDIzFiG/ULHSqqKGuFXsu/k0ae4CcJ8Zv7aU0bzsx9FKqgiGB
 TrXX879pyXsQ==
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="425615875"
Received: from lelicken-mobl2.ger.corp.intel.com (HELO localhost) ([10.249.37.239])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2021 07:23:40 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Hsin-Yi Wang <hsinyi@chromium.org>, Wolfram Sang <wsa@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v19 6/6] drm/i915/selftests: Rename functions names
In-Reply-To: <20210414172916.2689361-7-hsinyi@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210414172916.2689361-1-hsinyi@chromium.org> <20210414172916.2689361-7-hsinyi@chromium.org>
Date:   Fri, 16 Apr 2021 17:23:37 +0300
Message-ID: <87y2dicnpy.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 15 Apr 2021, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> pm_resume and pm_suspend might be conflict with the ones defined in
> include/linux/suspend.h. Rename pm_resume{suspend} to
> i915_pm_resume{suspend} since they are only used here.

I agree with the rationale here.

Do you need this to be part of your series, or shall we just pick this
up for i915? (We might consider renaming to something else or prefix the
functions with _ though, as we also have existing i915_pm_suspend and
i915_pm_resume elsewhere.)

BR,
Jani.

>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/gpu/drm/i915/selftests/i915_gem.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
> index dc394fb7ccfa..525afda9d31f 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
> @@ -94,7 +94,7 @@ static int pm_prepare(struct drm_i915_private *i915)
>  	return 0;
>  }
>  
> -static void pm_suspend(struct drm_i915_private *i915)
> +static void i915_pm_suspend(struct drm_i915_private *i915)
>  {
>  	intel_wakeref_t wakeref;
>  
> @@ -116,7 +116,7 @@ static void pm_hibernate(struct drm_i915_private *i915)
>  	}
>  }
>  
> -static void pm_resume(struct drm_i915_private *i915)
> +static void i915_pm_resume(struct drm_i915_private *i915)
>  {
>  	intel_wakeref_t wakeref;
>  
> @@ -152,12 +152,12 @@ static int igt_gem_suspend(void *arg)
>  	if (err)
>  		goto out;
>  
> -	pm_suspend(i915);
> +	i915_pm_suspend(i915);
>  
>  	/* Here be dragons! Note that with S3RST any S3 may become S4! */
>  	simulate_hibernate(i915);
>  
> -	pm_resume(i915);
> +	i915_pm_resume(i915);
>  
>  	err = switch_to_context(ctx);
>  out:
> @@ -192,7 +192,7 @@ static int igt_gem_hibernate(void *arg)
>  	/* Here be dragons! */
>  	simulate_hibernate(i915);
>  
> -	pm_resume(i915);
> +	i915_pm_resume(i915);
>  
>  	err = switch_to_context(ctx);
>  out:

-- 
Jani Nikula, Intel Open Source Graphics Center
