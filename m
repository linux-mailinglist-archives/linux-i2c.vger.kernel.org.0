Return-Path: <linux-i2c+bounces-143-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 074FD7EADCD
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 11:17:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 665A7281105
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 10:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE9E19453;
	Tue, 14 Nov 2023 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORGBZrBZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4904419448
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 10:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23CDC433C8;
	Tue, 14 Nov 2023 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699957017;
	bh=dGeTRv0PWClXlso6IfyrLb94RNVVGoSgFGtSPfab5P4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ORGBZrBZlIzrT0L6WnyVZtUxYL+FuVPTuvLfs7AwzOyiNA8Cn5Sk69COszrV7E19/
	 HqU0AmWTZV83gaBPwipWA2O+WGTAtYOzXPXXmpu+yWFvl4OUrYENS9p8nbjtttQOpD
	 UJw3jpLkxaF+u2/h69T7f4QZDLY8ZUdn/zRz/t6agA6kkB1oZ2rNGroMrFxrBRoQZw
	 3Ot1oVBLuG3MVOPIsaD9O9OGrbilnixz/Or8IfcKz4fBh4Vn3ZtIvuK1Xu7a/QdLKD
	 EiI0/kET0/7XJIDGzEtc0/5e/60y0MM4j/OuMfqD7TNXpEtkNgD6Ygg5OOTdp0bjRX
	 gStCFrCc9I1nw==
Date: Tue, 14 Nov 2023 05:16:43 -0500
From: Wolfram Sang <wsa@kernel.org>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Jean Delvare <jdelvare@suse.de>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [bug report] lockdep WARN at PCI device rescan
Message-ID: <ZVNJCxh5vgj22SfQ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Jean Delvare <jdelvare@suse.de>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FIBYGVLzZDAiE7Lv"
Content-Disposition: inline
In-Reply-To: <6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j>


--FIBYGVLzZDAiE7Lv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 06:54:29AM +0000, Shinichiro Kawasaki wrote:
> Hello there.
>=20
> Recently I tried a couple of commands below on the kernel v6.6 and v6.7-r=
c1,
> then observed a lockdep WARN at the second command [1]. The first command
> removes a PCI device, and the second command rescans whole PCI devices to
> regain the removed device.
>=20
>  # echo 1 > /sys/bus/pci/devices/0000:51:00.0/remove
>  # echo 1 > /sys/bus/pci/rescan
>=20
> I tried this rescan for SAS-HBA or AHCI controller with HDDs. When those =
devices
> are left in weird status after some kernel tests, I want to remove the SA=
S-HBA
> and AHCI controller and rescan to get back the devices in good status. Th=
is
> rescan looks working good except the WARN.
>=20
> The lockdep splat indicates possible deadlock between pci_rescan_remove_l=
ock
> and work_completion lock have deadlock possibility. Is the lockdep WARN a=
 known
> issue? I found a similar discussion in the past [2], but it did not discu=
ss the
> work_completion lock, so my observation looks a new, different issue.
>=20
> In the call stack, I found that the workqueue thread for i801_probe() cal=
ls
> p2sb_bar(), which locks pci_rescan_remove_lock. IMHO, the issue cause loo=
ks that
> pci_rescan_remove_lock is locked in both workqueue context and non-workqu=
eue
> context. As a fix trial, I created a quick patch [3]. It calls i801_probe=
() in
> non-workqueue context only by adding a new flag to struct pci_driver. Wit=
h this,
> I observed the lockdep WARN disappears. Is this a good solution approach?=
 If
> not, is there any other better solution?

Thanks for the report and the proposed solution. I'll add the i801
experts, Jean and Heiner, to CC.

>=20
> [1] kernel message log at the second command
>=20
> [  242.922091] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  242.931663] WARNING: possible circular locking dependency detected
> [  242.938292] mpt3sas_cm1: 63 BIT PCI BUS DMA ADDRESSING SUPPORTED, tota=
l mem (56799464 kB)
> [  242.939415] 6.7.0-rc1-kts #1 Not tainted
> [  242.939419] ------------------------------------------------------
> [  242.939421] bash/1615 is trying to acquire lock:
> [  242.939424] ff1100017bf87910 ((work_completion)(&wfc.work)){+.+.}-{0:0=
}, at: __flush_work+0xc5/0x980
> [  242.989069]=20
>                but task is already holding lock:
> [  243.000283] ffffffff870bf4a8 (pci_rescan_remove_lock){+.+.}-{3:3}, at:=
 rescan_store+0x96/0xd0
> [  243.012269]=20
>                which lock already depends on the new lock.
>=20
> [  243.028569]=20
>                the existing dependency chain (in reverse order) is:
> [  243.041611]=20
>                -> #1 (pci_rescan_remove_lock){+.+.}-{3:3}:
> [  243.053709]        __mutex_lock+0x16a/0x1880
> [  243.060767]        p2sb_bar+0xa7/0x250
> [  243.067213]        i801_add_tco_spt.constprop.0+0x88/0x1f0 [i2c_i801]
> [  243.076707]        i801_add_tco+0x18a/0x210 [i2c_i801]
> [  243.084727]        i801_probe+0x99c/0x1500 [i2c_i801]
> [  243.092618]        local_pci_probe+0xd6/0x190
> [  243.099708]        work_for_cpu_fn+0x4e/0xa0
> [  243.106673]        process_one_work+0x736/0x1230
> [  243.114012]        worker_thread+0x723/0x1300
> [  243.121039]        kthread+0x2ee/0x3d0
> [  243.127372]        ret_from_fork+0x2d/0x70
> [  243.134073]        ret_from_fork_asm+0x1b/0x30
> [  243.141140]=20
>                -> #0 ((work_completion)(&wfc.work)){+.+.}-{0:0}:
> [  243.153341]        __lock_acquire+0x2e74/0x5ea0
> [  243.160490]        lock_acquire+0x196/0x4b0
> [  243.167236]        __flush_work+0xe2/0x980
> [  243.173882]        work_on_cpu_key+0xcc/0xf0
> [  243.180709]        pci_device_probe+0x548/0x740
> [  243.187813]        really_probe+0x3df/0xb80
> [  243.194525]        __driver_probe_device+0x18c/0x450
> [  243.202128]        driver_probe_device+0x4a/0x120
> [  243.209437]        __device_attach_driver+0x15e/0x270
> [  243.217149]        bus_for_each_drv+0x101/0x170
> [  243.224260]        __device_attach+0x189/0x380
> [  243.231254]        pci_bus_add_device+0x9f/0xf0
> [  243.238360]        pci_bus_add_devices+0x7f/0x190
> [  243.245639]        pci_bus_add_devices+0x114/0x190
> [  243.253017]        pci_rescan_bus+0x23/0x30
> [  243.259711]        rescan_store+0xa2/0xd0
> [  243.266187]        kernfs_fop_write_iter+0x356/0x530
> [  243.273735]        vfs_write+0x513/0xd60
> [  243.280090]        ksys_write+0xe7/0x1b0
> [  243.286412]        do_syscall_64+0x5d/0xe0
> [  243.292908]        entry_SYSCALL_64_after_hwframe+0x6e/0x76
> [  243.301053]=20
>                other info that might help us debug this:
>=20
> [  243.315550]  Possible unsafe locking scenario:
>=20
> [  243.325803]        CPU0                    CPU1
> [  243.332654]        ----                    ----
> [  243.339492]   lock(pci_rescan_remove_lock);
> [  243.345937]                                lock((work_completion)(&wfc=
=2Ework));
> [  243.355852]                                lock(pci_rescan_remove_lock=
);
> [  243.365170]   lock((work_completion)(&wfc.work));
> [  243.372235]=20
>                 *** DEADLOCK ***
>=20
> [  243.384100] 5 locks held by bash/1615:
> [  243.390048]  #0: ff1100013f4b0418 (sb_writers#4){.+.+}-{0:0}, at: ksys=
_write+0xe7/0x1b0
> [  243.400833]  #1: ff11000128429888 (&of->mutex){+.+.}-{3:3}, at: kernfs=
_fop_write_iter+0x21d/0x530
> [  243.412623]  #2: ff11000103849968 (kn->active#136){.+.+}-{0:0}, at: ke=
rnfs_fop_write_iter+0x241/0x530
> [  243.424832]  #3: ffffffff870bf4a8 (pci_rescan_remove_lock){+.+.}-{3:3}=
, at: rescan_store+0x96/0xd0
> [  243.436773]  #4: ff1100019cc7e1a8 (&dev->mutex){....}-{3:3}, at: __dev=
ice_attach+0x67/0x380
> [  243.448048]=20
>                stack backtrace:
> [  243.456654] CPU: 16 PID: 1615 Comm: bash Not tainted 6.7.0-rc1-kts #1
> [  243.465797] Hardware name: Supermicro SYS-520P-WTR/X12SPW-TF, BIOS 1.2=
 02/14/2022
> [  243.476145] Call Trace:
> [  243.480820]  <TASK>
> [  243.485084]  dump_stack_lvl+0x57/0x90
> [  243.491112]  check_noncircular+0x2e1/0x3c0
> [  243.497630]  ? __pfx_check_noncircular+0x10/0x10
> [  243.504747]  ? __pfx___bfs+0x10/0x10
> [  243.510680]  ? lockdep_lock+0xbc/0x1a0
> [  243.516811]  ? __pfx_lockdep_lock+0x10/0x10
> [  243.523436]  __lock_acquire+0x2e74/0x5ea0
> [  243.529866]  ? __pfx___lock_acquire+0x10/0x10
> [  243.536682]  lock_acquire+0x196/0x4b0
> [  243.542710]  ? __flush_work+0xc5/0x980
> [  243.548829]  ? __pfx_lock_acquire+0x10/0x10
> [  243.555442]  ? __pfx___lock_acquire+0x10/0x10
> [  243.562252]  ? driver_probe_device+0x4a/0x120
> [  243.569061]  ? __device_attach_driver+0x15e/0x270
> [  243.576282]  ? mark_lock+0xee/0x16c0
> [  243.582222]  ? __flush_work+0xc5/0x980
> [  243.588364]  __flush_work+0xe2/0x980
> [  243.594300]  ? __flush_work+0xc5/0x980
> [  243.600425]  ? __queue_work+0x4e4/0xe30
> [  243.606658]  ? __pfx___flush_work+0x10/0x10
> [  243.613287]  ? lock_is_held_type+0xce/0x120
> [  243.619917]  ? queue_work_on+0x69/0xa0
> [  243.626032]  ? lockdep_hardirqs_on+0x7d/0x100
> [  243.632834]  work_on_cpu_key+0xcc/0xf0
> [  243.638950]  ? __pfx_work_on_cpu_key+0x10/0x10
> [  243.645849]  ? __pfx_work_for_cpu_fn+0x10/0x10
> [  243.652738]  ? __pfx_local_pci_probe+0x10/0x10
> [  243.659638]  pci_device_probe+0x548/0x740
> [  243.666057]  ? __pfx_pci_device_probe+0x10/0x10
> [  243.673057]  ? kernfs_create_link+0x167/0x230
> [  243.679855]  really_probe+0x3df/0xb80
> [  243.685860]  __driver_probe_device+0x18c/0x450
> [  243.692737]  driver_probe_device+0x4a/0x120
> [  243.699314]  __device_attach_driver+0x15e/0x270
> [  243.706297]  ? __pfx___device_attach_driver+0x10/0x10
> [  243.713890]  bus_for_each_drv+0x101/0x170
> [  243.720312]  ? __pfx_bus_for_each_drv+0x10/0x10
> [  243.727294]  ? lockdep_hardirqs_on+0x7d/0x100
> [  243.734063]  ? _raw_spin_unlock_irqrestore+0x35/0x60
> [  243.741505]  __device_attach+0x189/0x380
> [  243.747747]  ? __pfx___device_attach+0x10/0x10
> [  243.754554]  pci_bus_add_device+0x9f/0xf0
> [  243.760836]  pci_bus_add_devices+0x7f/0x190
> [  243.767328]  pci_bus_add_devices+0x114/0x190
> [  243.773890]  pci_rescan_bus+0x23/0x30
> [  243.779741]  rescan_store+0xa2/0xd0
> [  243.785362]  ? __pfx_rescan_store+0x10/0x10
> [  243.791785]  kernfs_fop_write_iter+0x356/0x530
> [  243.798516]  vfs_write+0x513/0xd60
> [  243.804054]  ? __pfx_vfs_write+0x10/0x10
> [  243.810193]  ? __fget_light+0x51/0x220
> [  243.816125]  ? __pfx_lock_release+0x10/0x10
> [  243.822555]  ksys_write+0xe7/0x1b0
> [  243.828097]  ? __pfx_ksys_write+0x10/0x10
> [  243.834327]  ? syscall_enter_from_user_mode+0x22/0x90
> [  243.841736]  ? lockdep_hardirqs_on+0x7d/0x100
> [  243.848366]  do_syscall_64+0x5d/0xe0
> [  243.854114]  ? do_syscall_64+0x6c/0xe0
> [  243.860053]  ? do_syscall_64+0x6c/0xe0
> [  243.865989]  ? lockdep_hardirqs_on+0x7d/0x100
> [  243.872608]  ? do_syscall_64+0x6c/0xe0
> [  243.878537]  ? lockdep_hardirqs_on+0x7d/0x100
> [  243.885147]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
> [  243.892555] RIP: 0033:0x7fee10d53c34
> [  243.898305] Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 0=
0 00 00 00 00 f3 0f 1e fa 80 3d 35 77 0d 00 00 74 13 b8 01 00 00 00 0f 05 <=
48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
> [  243.922266] RSP: 002b:00007ffd173e68e8 EFLAGS: 00000202 ORIG_RAX: 0000=
000000000001
> [  243.932655] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007fee1=
0d53c34
> [  243.942564] RDX: 0000000000000002 RSI: 000055f17c9c4bc0 RDI: 000000000=
0000001
> [  243.952485] RBP: 00007ffd173e6910 R08: 0000000000000073 R09: 000000000=
0000001
> [  243.962408] R10: 0000000000000000 R11: 0000000000000202 R12: 000000000=
0000002
> [  243.972328] R13: 000055f17c9c4bc0 R14: 00007fee10e245c0 R15: 00007fee1=
0e21f20
> [  243.982259]  </TASK>
>=20
> [2] https://patchwork.kernel.org/project/linux-pci/patch/20180921205752.3=
191-1-keith.busch@intel.com/
>=20
> [3] fix trial patch
>=20
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 070999139c6..00d57d4e006 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1820,6 +1820,7 @@ static struct pci_driver i801_driver =3D {
>  		.pm	=3D pm_sleep_ptr(&i801_pm_ops),
>  		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>  	},
> +	.local_probe	=3D true,
>  };
> =20
>  static int __init i2c_i801_init(struct pci_driver *drv)
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index 51ec9e7e784..161ff37143a 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -368,7 +368,7 @@ static int pci_call_probe(struct pci_driver *drv, str=
uct pci_dev *dev,
>  	 * device is probed from work_on_cpu() of the Physical device.
>  	 */
>  	if (node < 0 || node >=3D MAX_NUMNODES || !node_online(node) ||
> -	    pci_physfn_is_probed(dev)) {
> +	    pci_physfn_is_probed(dev) || drv->local_probe) {
>  		cpu =3D nr_cpu_ids;
>  	} else {
>  		cpumask_var_t wq_domain_mask;
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 60ca768bc86..6fd086eb26c 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -957,6 +957,7 @@ struct pci_driver {
>  	struct device_driver	driver;
>  	struct pci_dynids	dynids;
>  	bool driver_managed_dma;
> +	bool local_probe;
>  };
> =20
>  static inline struct pci_driver *to_pci_driver(struct device_driver *drv)
>=20

--FIBYGVLzZDAiE7Lv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVTSQcACgkQFA3kzBSg
KbYkzg//RCZEo3fkpWPGHQRx2QrSiUh74Rgd5EKUrsICT/XJvIjN/MVZyHPXFNEH
Vi3uHRcd4OSXRNPH34jWb5UFX5T0H8RW96aP/pA6MpTKi3R+uKBUx2VJou3dG1t9
xw8f3/SF/XsDz74FQS2hKwTLAC+bcp1R5zeCtMSTjeBMTciw/perpGMslAM+E2vs
pyX5ses8SBQVxhOUXKJNYap1s2WsPFMnFDouS8/52FzcUvOuLAco9n0eidTdBEtY
3xDP/u8mmfzHet+KJyn9sxAa+cCW8+1cL6/TxLX7TkO3AM7pzT5fcAW2yzU7gLBP
xxefEUI72UNMd6VZAm5LEunf/9eihfOUz20YRXQOTxpHjNlYjVwqchOXqYvXK7hA
XEZLkG7A0pR/LpNGoFP3er/acUhM0nqfC1af4TS7CoLiFiDAhkmPccf4uXxuMaf9
SsZHFZnOsH+2BxxdYeLyLJQ5tWlMbCnw9G9kEYDCW9ix8fn5jwWcEN92jspMWCsH
JPfaWTXIGttB39qO0REwP+d0fI/ucfbh7JUyXjd/SZtIUDHUfQJcgBixwR1Yx6ap
e8ExyEN5MYc56iNCjw54EDVgCd+mliGvFR+1wawp5Yf1CfhSwoTsYO+iywFf4d3G
LBVgpoexvqlT3Eo25qTCyDnbjUurXYwIC55BRDOVoT3varY3e/w=
=yHEE
-----END PGP SIGNATURE-----

--FIBYGVLzZDAiE7Lv--

