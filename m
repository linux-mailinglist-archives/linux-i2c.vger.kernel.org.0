Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D221A10833E
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Nov 2019 12:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbfKXLpg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 24 Nov 2019 06:45:36 -0500
Received: from mga17.intel.com ([192.55.52.151]:41034 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725980AbfKXLpg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 24 Nov 2019 06:45:36 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Nov 2019 03:45:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,237,1571727600"; 
   d="gz'50?scan'50,208,50";a="382528521"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Nov 2019 03:45:32 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iYqKZ-0001LN-TR; Sun, 24 Nov 2019 19:45:31 +0800
Date:   Sun, 24 Nov 2019 19:44:56 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        wsa@the-dreams.de, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] drivers: i2c: introduce devm_i2c_add_adapter()
Message-ID: <201911241925.E76M2K1V%lkp@intel.com>
References: <20191121152716.23940-1-info@metux.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="klwyoh2zo4xcs6kq"
Content-Disposition: inline
In-Reply-To: <20191121152716.23940-1-info@metux.net>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--klwyoh2zo4xcs6kq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi "Enrico,

I love your patch! Perhaps something to improve:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on v5.4-rc8 next-20191122]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Enrico-Weigelt-metux-IT-consult/drivers-i2c-introduce-devm_i2c_add_adapter/20191124-070955
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
reproduce: make htmldocs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   Warning: The Sphinx 'sphinx_rtd_theme' HTML theme was not found. Make sure you have the theme installed to produce pretty HTML output. Falling back to the default theme.
   WARNING: dot(1) not found, for better output quality install graphviz from http://www.graphviz.org
   WARNING: convert(1) not found, for SVG to PDF conversion install ImageMagick (https://www.imagemagick.org)
   include/linux/regulator/machine.h:196: warning: Function parameter or member 'max_uV_step' not described in 'regulation_constraints'
   include/linux/regulator/driver.h:223: warning: Function parameter or member 'resume' not described in 'regulator_ops'
   Error: Cannot open file drivers/dma-buf/reservation.c
   Error: Cannot open file drivers/dma-buf/reservation.c
   Error: Cannot open file drivers/dma-buf/reservation.c
   Error: Cannot open file include/linux/reservation.h
   Error: Cannot open file include/linux/reservation.h
   drivers/gpio/gpiolib-of.c:92: warning: Excess function parameter 'dev' description in 'of_gpio_need_valid_mask'
   include/linux/i2c.h:337: warning: Function parameter or member 'init_irq' not described in 'i2c_client'
>> drivers/i2c/i2c-core-base.c:1470: warning: Function parameter or member 'parent' not described in 'devm_i2c_add_adapter'
>> drivers/i2c/i2c-core-base.c:1470: warning: Function parameter or member 'adap' not described in 'devm_i2c_add_adapter'
   drivers/i2c/i2c-core-base.c:1470: warning: Excess function parameter 'adapter' description in 'devm_i2c_add_adapter'
   include/linux/spi/spi.h:190: warning: Function parameter or member 'driver_override' not described in 'spi_device'
   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:335: warning: Excess function parameter 'dev' description in 'amdgpu_gem_prime_export'
   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:336: warning: Excess function parameter 'dev' description in 'amdgpu_gem_prime_export'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:142: warning: Function parameter or member 'blockable' not described in 'amdgpu_mn_read_lock'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:347: warning: cannot understand function prototype: 'struct amdgpu_vm_pt_cursor '
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:348: warning: cannot understand function prototype: 'struct amdgpu_vm_pt_cursor '
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:494: warning: Function parameter or member 'start' not described in 'amdgpu_vm_pt_first_dfs'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:546: warning: Function parameter or member 'adev' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:546: warning: Function parameter or member 'vm' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:546: warning: Function parameter or member 'start' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:546: warning: Function parameter or member 'cursor' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:546: warning: Function parameter or member 'entry' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:821: warning: Function parameter or member 'level' not described in 'amdgpu_vm_bo_param'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1283: warning: Function parameter or member 'params' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1283: warning: Function parameter or member 'bo' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1283: warning: Function parameter or member 'level' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1283: warning: Function parameter or member 'pe' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1283: warning: Function parameter or member 'addr' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1283: warning: Function parameter or member 'count' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1283: warning: Function parameter or member 'incr' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1283: warning: Function parameter or member 'flags' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2821: warning: Function parameter or member 'pasid' not described in 'amdgpu_vm_make_compute'
   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:378: warning: Excess function parameter 'entry' description in 'amdgpu_irq_dispatch'
   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:379: warning: Function parameter or member 'ih' not described in 'amdgpu_irq_dispatch'
   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:379: warning: Excess function parameter 'entry' description in 'amdgpu_irq_dispatch'
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:1: warning: no structured comments found
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1: warning: no structured comments found
   drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c:1: warning: 'pp_dpm_sclk pp_dpm_mclk pp_dpm_pcie' not found
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:132: warning: Incorrect use of kernel-doc format:          * @atomic_obj
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:238: warning: Incorrect use of kernel-doc format:          * gpu_info FW provided soc bounding box struct or 0 if not
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:243: warning: Function parameter or member 'atomic_obj' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:243: warning: Function parameter or member 'backlight_link' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:243: warning: Function parameter or member 'backlight_caps' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:243: warning: Function parameter or member 'freesync_module' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:243: warning: Function parameter or member 'fw_dmcu' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:243: warning: Function parameter or member 'dmcu_fw_version' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:243: warning: Function parameter or member 'soc_bounding_box' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:1: warning: 'register_hpd_handlers' not found
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:1: warning: 'dm_crtc_high_irq' not found
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:1: warning: 'dm_pflip_high_irq' not found
   mm/util.c:1: warning: 'get_user_pages_fast' not found
   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_unregister_driver' not found
   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_register_driver' not found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_unregister_notifier' not found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_register_notifier' not found
   include/linux/w1.h:277: warning: Function parameter or member 'of_match_table' not described in 'w1_family'
   fs/posix_acl.c:647: warning: Function parameter or member 'inode' not described in 'posix_acl_update_mode'
   fs/posix_acl.c:647: warning: Function parameter or member 'mode_p' not described in 'posix_acl_update_mode'
   fs/posix_acl.c:647: warning: Function parameter or member 'acl' not described in 'posix_acl_update_mode'
   kernel/dma/coherent.c:1: warning: no structured comments found
   include/linux/input/sparse-keymap.h:43: warning: Function parameter or member 'sw' not described in 'key_entry'
   lib/genalloc.c:1: warning: 'gen_pool_add_virt' not found
   lib/genalloc.c:1: warning: 'gen_pool_alloc' not found
   lib/genalloc.c:1: warning: 'gen_pool_free' not found
   lib/genalloc.c:1: warning: 'gen_pool_alloc_algo' not found
   include/linux/rculist.h:374: warning: Excess function parameter 'cond' description in 'list_for_each_entry_rcu'
   include/linux/rculist.h:651: warning: Excess function parameter 'cond' description in 'hlist_for_each_entry_rcu'
   include/linux/skbuff.h:888: warning: Function parameter or member 'dev_scratch' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'list' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'ip_defrag_offset' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'skb_mstamp_ns' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member '__cloned_offset' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'head_frag' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member '__pkt_type_offset' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'encapsulation' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'encap_hdr_csum' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'csum_valid' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member '__pkt_vlan_present_offset' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'vlan_present' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'csum_complete_sw' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'csum_level' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'inner_protocol_type' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'remcsum_offload' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'sender_cpu' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'reserved_tailroom' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'inner_ipproto' not described in 'sk_buff'
   include/net/sock.h:233: warning: Function parameter or member 'skc_addrpair' not described in 'sock_common'
   include/net/sock.h:233: warning: Function parameter or member 'skc_portpair' not described in 'sock_common'
   include/net/sock.h:233: warning: Function parameter or member 'skc_ipv6only' not described in 'sock_common'
   include/net/sock.h:233: warning: Function parameter or member 'skc_net_refcnt' not described in 'sock_common'
   include/net/sock.h:233: warning: Function parameter or member 'skc_v6_daddr' not described in 'sock_common'
   include/net/sock.h:233: warning: Function parameter or member 'skc_v6_rcv_saddr' not described in 'sock_common'
   include/net/sock.h:233: warning: Function parameter or member 'skc_cookie' not described in 'sock_common'
   include/net/sock.h:233: warning: Function parameter or member 'skc_listener' not described in 'sock_common'
   include/net/sock.h:233: warning: Function parameter or member 'skc_tw_dr' not described in 'sock_common'
   include/net/sock.h:233: warning: Function parameter or member 'skc_rcv_wnd' not described in 'sock_common'
   include/net/sock.h:233: warning: Function parameter or member 'skc_tw_rcv_nxt' not described in 'sock_common'
   include/net/sock.h:515: warning: Function parameter or member 'sk_rx_skb_cache' not described in 'sock'
   include/net/sock.h:515: warning: Function parameter or member 'sk_wq_raw' not described in 'sock'
   include/net/sock.h:515: warning: Function parameter or member 'tcp_rtx_queue' not described in 'sock'
   include/net/sock.h:515: warning: Function parameter or member 'sk_tx_skb_cache' not described in 'sock'
   include/net/sock.h:515: warning: Function parameter or member 'sk_route_forced_caps' not described in 'sock'
   include/net/sock.h:515: warning: Function parameter or member 'sk_txtime_report_errors' not described in 'sock'
   include/net/sock.h:515: warning: Function parameter or member 'sk_validate_xmit_skb' not described in 'sock'
   include/net/sock.h:515: warning: Function parameter or member 'sk_bpf_storage' not described in 'sock'
   include/net/sock.h:2455: warning: Function parameter or member 'tcp_rx_skb_cache_key' not described in 'DECLARE_STATIC_KEY_FALSE'
   include/net/sock.h:2455: warning: Excess function parameter 'sk' description in 'DECLARE_STATIC_KEY_FALSE'
   include/net/sock.h:2455: warning: Excess function parameter 'skb' description in 'DECLARE_STATIC_KEY_FALSE'
   include/linux/netdevice.h:1765: warning: bad line:                                 spinlock

vim +1470 drivers/i2c/i2c-core-base.c

  1459	
  1460	/**
  1461	 * devm_i2c_add_adapter - devm version of i2c_add_adapter()
  1462	 * @adapter: the adapter to add
  1463	 * @data: private data to attach (if non-NULL)
  1464	 * Context: can sleep
  1465	 */
  1466	int devm_i2c_add_adapter(struct device *parent,
  1467				 struct i2c_adapter *adap,
  1468				 void *data)
  1469	{
> 1470		struct i2c_adapter **dr;
  1471		int rc;
  1472	
  1473		dr = devres_alloc(devm_i2c_adapter_release, sizeof(*dr), GFP_KERNEL);
  1474		if (!dr)
  1475			return -ENOMEM;
  1476	
  1477		rc = i2c_add_adapter(adap);
  1478		if (rc) {
  1479			devres_free(dr);
  1480			return rc;
  1481		}
  1482	
  1483		if (data)
  1484			i2c_set_adapdata(adap, data);
  1485	
  1486		*dr = adap;
  1487		devres_add(parent, dr);
  1488	
  1489		return 0;
  1490	}
  1491	EXPORT_SYMBOL_GPL(devm_i2c_add_adapter);
  1492	

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--klwyoh2zo4xcs6kq
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--klwyoh2zo4xcs6kq--
